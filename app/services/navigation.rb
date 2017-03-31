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
    if skip_to_claim_step?
      :claim
    elsif skip_income_steps?
      probate_or_claim
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

  def skip_probate?
    @current_question == :income_amount
  end

  def skip_income_range?
    (@current_question == :income_kind && @online_application.income&.zero?)
  end

  def skip_income_amount?
    @current_question == :income_range &&
      (!@online_application.income_min_threshold_exceeded ||
        @online_application.income_max_threshold_exceeded)
  end

  def skip_income_steps?
    skip_income? || skip_income_range? || skip_income_amount?
  end

  def skip_to_claim_step?
    ProbateFeesSwitch.use_probate_fees_changes? &&
      (skip_income_steps? || skip_probate?)
  end

  def skip_savings_and_investment_extra?
    @current_question == :savings_and_investment &&
      !@online_application.savings_and_investment_extra_required?
  end
end
