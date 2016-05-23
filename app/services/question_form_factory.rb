class QuestionFormFactory
  class QuestionDoesNotExist < StandardError; end

  # These are ordered
  IDS = [
    :form_name,
    :marital_status,
    :savings_and_investment,
    :benefit,
    :dependent,
    :income,
    :fee,
    :probate,
    :claim,
    :national_insurance,
    :dob,
    :personal_detail,
    :applicant_address,
    :contact
  ].freeze

  def self.position(id)
    IDS.index(id)
  end

  def self.get_form(id)
    raise QuestionDoesNotExist unless IDS.include?(id)

    class_name = "Forms::#{id.to_s.classify}".constantize
    class_name.new
  end
end
