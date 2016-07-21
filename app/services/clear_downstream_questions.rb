class ClearDownstreamQuestions
  def initialize(storage, question)
    @storage = storage
    @question = question
  end

  def for_changes(old_online_application, new_online_application)
    if dependent_change?(new_online_application, old_online_application) ||
       income_kind_change?(new_online_application, old_online_application)
      @storage.clear_form(:income_range)
      @storage.clear_form(:income_amount)
    elsif income_range_change?(new_online_application, old_online_application)
      @storage.clear_form(:income_amount)
    end
  end

  def income_kind_change?(new_online_application, old_online_application)
    @question == :income_kind &&
      old_online_application.income != 0 &&
      new_online_application.income == 0
  end

  def income_range_change?(new_online_application, old_online_application)
    @question == :income_range &&
      old_online_application.income_min_threshold_exceeded !=
        new_online_application.income_min_threshold_exceeded ||
      old_online_application.income_max_threshold_exceeded !=
        new_online_application.income_max_threshold_exceeded
  end

  def dependent_change?(new_online_application, old_online_application)
    @question == :dependent &&
      old_online_application.children != new_online_application.children
  end
end
