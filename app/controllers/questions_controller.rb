class QuestionsController < ApplicationController
  rescue_from QuestionFormFactory::QuestionDoesNotExist, with: :not_found
  before_action :redirect_if_storage_unstarted
  after_action :suppress_browser_cache

  def edit
    storage.load_form(form)
  end

  def update
    form.update_attributes(form_params)

    if form.valid?
      save_and_update_online_application
      redirect_to(Navigation.new(online_application, question).next)
    else
      render :edit
    end
  end

  # FIXME: This is a temporary helper method, until some kind of context is implemented which allows
  # accessing previously answered questions.
  helper_method def married?
    session['questions']['marital_status'] ? session['questions']['marital_status']['married'] : nil
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

  def not_found
    render nothing: true, status: :not_found
  end
end
