class QuestionsController < ApplicationController
  rescue_from QuestionFormFactory::QuestionDoesNotExist, with: :not_found
  before_action :redirect_if_storage_unstarted
  after_action :suppress_browser_cache
  before_action :address_lookup_access_token

  def edit
    assign_title_view
    assign_page_number
    storage.load_form(form)
  end

  def update
    form.update_attributes(form_params)

    if form.valid?
      process_form_and_online_application
      redirect_to(Navigation.new(online_application, question).next)
    else
      assign_title_view
      assign_page_number
      render :edit
    end
  end

  private

  def question
    @question ||= params[:id].to_sym
  end

  def form
    @form ||= QuestionFormFactory.get_form(question)
  end

  def form_params
    params.require(@form.id).permit(*@form.permitted_attributes).to_h
  end

  def process_form_and_online_application
    storage.save_form(form)
    old_online_application = online_application.dup
    online_application.attributes = form.export
    clear_service.for_changes(old_online_application, online_application)
  end

  def clear_service
    ClearDownstreamQuestions.new(storage, question)
  end

  def assign_title_view
    @title_view = Views::QuestionTitle.new(form, online_application)
  end

  def not_found
    render file: 'public/404.html', status: :not_found, layout: false
  end

  def assign_page_number
    @page_number = Navigation.new(online_application, question).page_number
  end

  def address_lookup_access_token
    return if question != :applicant_address
    Rails.cache.fetch('address_lookup', expires_in: 290) do
      uri = URI(Rails.configuration.x.address_lookup.endpoint)

      req = Net::HTTP::Post.new('/oauth2/token/v1')
      req.basic_auth(
        Rails.configuration.x.address_lookup.api_key,
        Rails.configuration.x.address_lookup.api_secret
      )
      req.set_form_data('grant_type' => 'client_credentials')

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.instance_of? URI::HTTPS
      begin
        res = http.request(req)
        if res.is_a?(Net::HTTPSuccess)
          JSON.parse(res.body).fetch('access_token', nil).tap do |token|
            Rails.logger.info("[Address Lookup] :: os cred #{res.body} -- token: #{token}")
          end
        end
      rescue StandardError => e
        Rails.logger.error("Address Lookup Fetch Access Token error: #{e}")
        nil
      end
    end
  end
end
