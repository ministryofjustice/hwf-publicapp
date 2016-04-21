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
      storage.save_form(form)
      redirect_to(Navigation.new(question).next)
    else
      render :edit
    end
  end

  # FIXME: This is a temporary helper method, until some kind of context is implemented which allows
  # accessing previously answered questions.
  helper_method def married?
    session['marital_status'] ? session['marital_status']['married'] : nil
  end

  private

  def question
    @question ||= params[:id].to_sym
  end

  def form
    @form ||= QuestionFormFactory.get_form(question)
  end

  def form_params
    params.require(@form.id).permit(*@form.permitted_attributes)
  end

  def not_found
    render nothing: true, status: :not_found
  end
end
