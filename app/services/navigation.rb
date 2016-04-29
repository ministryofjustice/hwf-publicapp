class Navigation
  include Rails.application.routes.url_helpers

  def initialize(online_application, current_question)
    @online_application = online_application
    @current_question = current_question
  end

  def next
    if @current_question == QuestionFormFactory::IDS.last
      summary_path
    else
      question_path(next_question_id)
    end
  end

  private

  def next_question_id
    if @current_question == :benefit && @online_application.benefits?
      :fee
    else
      current_question_index = QuestionFormFactory::IDS.find_index(@current_question)
      QuestionFormFactory::IDS[current_question_index + 1]
    end
  end
end
