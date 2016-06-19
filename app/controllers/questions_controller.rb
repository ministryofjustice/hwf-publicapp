class QuestionsController < ApplicationController
  rescue_from QuestionFormFactory::QuestionDoesNotExist, with: :not_found
  before_action :redirect_if_storage_unstarted
  after_action :suppress_browser_cache

  def edit
    assign_title_view
    storage.load_form(form)
  end

  def update
    form.update_attributes(form_params)

    if form.valid?
      save_and_update_online_application
      redirect_to(Navigation.new(online_application, question).next)
    else
      assign_title_view
      render :edit
    end
  end

  private

  def question
    @question ||= params[:id].to_sym
  end

  def form
    @form ||= QuestionFormFactory.get_form(question, online_application)
  end

  def form_params
    params.require(@form.id).permit(*@form.permitted_attributes)
  end

  def save_and_update_online_application
    storage.save_form(form)
    online_application.attributes = form.export
  end

  def assign_title_view
    @title_view = Views::QuestionTitle.new(form, online_application)
  end

  def not_found
    render nothing: true, status: :not_found
  end
end
