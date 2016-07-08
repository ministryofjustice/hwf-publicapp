class ClearDownstreamQuestions
  def initialize(storage, question)
    @storage = storage
    @question = question
  end

  def for_changes(old_online_application, new_online_application)
    if @question == :dependent && old_online_application.children != new_online_application.children
      @storage.clear_form(:income_range)
      @storage.clear_form(:income_amount)
    end
  end
end
