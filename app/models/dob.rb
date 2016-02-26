class Dob < Base
  attribute :date_of_birth, Date

  MINIMUM_AGE = 16
  MAXIMUM_AGE = 120
  MIN_DOB = Time.zone.today - MINIMUM_AGE.years
  MAX_DOB = Time.zone.today - MAXIMUM_AGE.years

  validate :dob_age_valid?

  private

  def dob_age_valid?
    validate_dob
    validate_dob_ranges unless errors.include?(:date_of_birth)
  end

  def validate_dob
    if date_of_birth =~ /[a-zA-Z]/
      errors.add(:date_of_birth, "can't contain non numbers")
    elsif !date_of_birth.is_a?(Date)
      errors.add(:date_of_birth, :not_a_date)
    end
  end

  def validate_dob_ranges
    if date_of_birth > MIN_DOB
      errors.add(:date_of_birth, :too_young, minimum_age: MINIMUM_AGE)
    elsif date_of_birth < MAX_DOB
      errors.add(:date_of_birth, :too_old, maximum_age: MAXIMUM_AGE)
    end
  end
end
