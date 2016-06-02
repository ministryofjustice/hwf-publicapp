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

  def self.get_form(id, online_application)
    raise QuestionDoesNotExist unless IDS.include?(id)

    class_name = "Forms::#{form_class_name(id, online_application)}".constantize
    class_name.new
  end

  def self.form_class_name(id, _online_application)
    id.to_s.classify
  end
end
