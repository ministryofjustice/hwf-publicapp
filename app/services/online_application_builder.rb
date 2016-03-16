class OnlineApplicationBuilder
  PARTS = [
    :marital_status,
    :savings_and_investment,
    :benefit,
    :dependent,
    :fee,
    :income,
    :probate,
    :claim,
    :form_name,
    :national_insurance,
    :personal_detail,
    :dob,
    :applicant_address,
    :contact
  ].freeze

  attr_reader :online_application

  def initialize(session)
    @session = session
    build_application
  end

  private

  def build_application
    params = PARTS.inject({}) do |result, part|
      model_class = part.to_s.classify.constantize
      result.merge!(model_class.new(@session[part]).export)
    end

    @online_application = OnlineApplication.new(params)
  end
end
