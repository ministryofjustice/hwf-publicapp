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
    if skip_income? || skip_further_income?
      :probate
    elsif skip_savings_and_investment_extra?
      :benefit
    else
      current_question_index = QuestionFormFactory::IDS.find_index(@current_question)
      QuestionFormFactory::IDS[current_question_index + 1]
    end
  end

  def skip_income?
    @current_question == :benefit && @online_application.benefits?
  end

  def skip_further_income?
    @current_question == :income_kind && @online_application.income == 0
  end

  def skip_savings_and_investment_extra?
    @current_question == :savings_and_investment &&
      !@online_application.savings_and_investment_extra_required?
  end
end
