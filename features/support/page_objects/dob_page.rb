class DobPage < BasePage
  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 14 of 20'
    element :dob_header, 'h1', text: 'What is your date of birth?'
    element :dob_hint, '.hint', text: 'Use this format D D / M M / Y Y Y Y'
    element :dob_date_of_birth, '#dob_date_of_birth'
    element :blank_error_link, 'a', text: 'Enter the date in this format DD/MM/YYYY'
    element :blank_error_message, '.error-message', text: 'Enter the date in this format DD/MM/YYYY'
    element :under_age_error_link, 'a', text: 'You must be over 15 to use this service'
    element :under_age_error_message, '.error-message', text: 'You must be over 15 to use this service'
    element :over_age_error_link, 'a', text: 'Check this date of birth is correct'
    element :over_age_error_message, '.error-message', text: 'Check this date of birth is correct'
  end

  def valid_dob
    content.dob_date_of_birth.set(Time.zone.today - 34.years)
    continue
  end

  def under_age_dob
    content.dob_date_of_birth.set(Time.zone.today - 14.years)
    continue
  end

  def over_age_dob
    content.dob_date_of_birth.set(Time.zone.today - 150.years)
    continue
  end
end
