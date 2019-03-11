class Navigation
  include Rails.application.routes.url_helpers

  def initialize(online_application, current_question)
    @online_application = online_application
    @current_question = current_question
  end

  def next
    if @current_question == QuestionFormFactory::IDS.last
      summary_path(locale: I18n.locale)
    else
      question_path(next_question_id, locale: I18n.locale)
    end
  end

  private

  def next_question_id
    if skip_income_questions?
      probate_or_claim
    elsif skip_savings_and_investment_extra?
      :benefit
    else
      question_id
    end
  end

  def question_id
    current_question_index = QuestionFormFactory::IDS.find_index(@current_question)
    next_id = QuestionFormFactory::IDS[current_question_index + 1]

    if next_id == :probate && !enable_probate?
      :claim
    else
      next_id
    end
  end

  def skip_income_questions?
    skip_income? || skip_income_range? || skip_income_amount?
  end

  def probate_or_claim
    enable_probate? ? :probate : :claim
  end

  def enable_probate?
    !ProbateFeesSwitch.disable_probate_fees?
  end

  def skip_income?
    @current_question == :benefit && @online_application.benefits?
  end

  def skip_income_range?
    (@current_question == :income_kind && @online_application.income&.zero?)
  end

  def skip_income_amount?
    @current_question == :income_range &&
      (!@online_application.income_min_threshold_exceeded ||
        @online_application.income_max_threshold_exceeded)
  end

  def skip_savings_and_investment_extra?
    @current_question == :savings_and_investment &&
      !@online_application.savings_and_investment_extra_required?
  end
end
