class QuestionFormFactory
  class QuestionDoesNotExist < StandardError; end

  IDS = [
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

  def self.get_form(id)
    raise QuestionDoesNotExist unless IDS.include?(id)

    class_name = id.to_s.classify.constantize
    class_name.new
  end
end
