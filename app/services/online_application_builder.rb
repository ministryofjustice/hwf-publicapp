class OnlineApplicationBuilder
  attr_reader :online_application

  def initialize(storage)
    @storage = storage
    build_application
  end

  private

  def build_application
    params = QuestionFormFactory::IDS.inject({}) do |result, id|
      form = QuestionFormFactory.get_form(id)
      @storage.load_form(form)
      result.merge!(form.export)
    end

    @online_application = OnlineApplication.new(params)
  end
end
