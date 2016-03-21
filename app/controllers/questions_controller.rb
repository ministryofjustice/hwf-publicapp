class QuestionsController < ApplicationController
  rescue_from QuestionFormFactory::QuestionDoesNotExist, with: :not_found

  def edit
    @form = QuestionFormFactory.get_form(question)
    storage.load_form(@form)
  end

  def update
    @form = QuestionFormFactory.get_form(question)
    @form.update_attributes(form_params)

    if @form.valid?
      storage.save_form(@form)
      redirect_to(Navigation.new(question).next)
    else
      render :edit
    end
  end

  private

  def question
    @question ||= params[:id].to_sym
  end

  def form_params
    params.require(@form.id).permit(*@form.permitted_attributes)
  end

  def storage
    @storage ||= Storage.new(session)
  end

  def not_found
    render nothing: true, status: :not_found
  end
end
