class Dob < Base
  attribute :date_of_birth, Date

  MINIMUM_AGE = 15
  MAXIMUM_AGE = 120

  validate :dob_age_valid?

  private

  def minimum_date_of_birth
    Time.zone.today - MINIMUM_AGE.years
  end

  def maximum_date_of_birth
    Time.zone.today - MAXIMUM_AGE.years
  end

  def dob_age_valid?
    validate_dob
    validate_dob_ranges unless errors.include?(:date_of_birth)
  end

  def validate_dob
    if date_of_birth =~ /[a-zA-Z]/ || !date_of_birth.is_a?(Date)
      errors.add(:date_of_birth, :not_a_date)
    end
  end

  def validate_dob_ranges
    too_young_error if too_young?
    too_old_error if too_old?
  end

  def too_young?
    date_of_birth > minimum_date_of_birth
  end

  def too_young_error
    errors.add(:date_of_birth, :too_young, minimum_age: MINIMUM_AGE)
  end

  def too_old?
    date_of_birth < maximum_date_of_birth
  end

  def too_old_error
    errors.add(:date_of_birth, :too_old)
  end
end
