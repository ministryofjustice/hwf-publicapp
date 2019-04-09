class ProbatePage < BasePage
  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 11 of 20'
    element :probate_header, 'h1', text: 'Are you paying a fee for a probate case?'
    element :probate_hint, '.text', text: 'These cases are usually about the property and belongings of someone who has died.'
    element :yes, '.block-label', text: 'Yes'
    element :no, '.block-label', text: 'No'
    element :name_of_deceased, '.form-label', text: 'Name of deceased'
    element :probate_deceased_name, '#probate_deceased_name'
    element :probate_day_date_of_death, '#probate_day_date_of_death'
    element :probate_month_date_of_death, '#probate_month_date_of_death'
    element :probate_year_date_of_death, '#probate_year_date_of_death'
    element :blank_error_link, 'a', text: 'Select whether you\'re paying a fee for a probate case'
    element :blank_error_message, '.error-message', text: 'Select whether you\'re paying a fee for a probate case'
    element :future_date_error_link, 'a', text: 'This date can\'t be in the future'
    element :future_date_error_message, '.error-message', text: 'This date can\'t be in the future'
    element :expired_date_error_link, 'a', text: 'The date of death must have been in the last 20 years'
    element :expired_date_error_message, '.error-message', text: 'The date of death must have been in the last 20 years'
    element :invalid_date_error_link, 'a', text: 'Enter the date in this format DD/MM/YYYY'
    element :invalid_date_error_message, '.error-message', text: 'Enter the date in this format DD/MM/YYYY'
  end

  def answer_yes
    probate_page.content.yes.click
  end

  def submit_no
    probate_page.content.no.click
    continue
  end

  def deceased_name
    probate_page.content.probate_deceased_name.set('John Smith')
  end

  def valid_date_of_death
    date = Time.zone.today - 1.month
    probate_page.content.probate_day_date_of_death.set(date.day)
    probate_page.content.probate_month_date_of_death.set(date.month)
    probate_page.content.probate_year_date_of_death.set(date.year)
    continue
  end

  def date_of_death_over_20_years
    date = Time.zone.today - 21.years
    probate_page.content.probate_day_date_of_death.set(date.day)
    probate_page.content.probate_month_date_of_death.set(date.month)
    probate_page.content.probate_year_date_of_death.set(date.year)

    continue
  end

  def invalid_date_of_death
    probate_page.content.probate_day_date_of_death.set('31')
    probate_page.content.probate_month_date_of_death.set('02')
    probate_page.content.probate_year_date_of_death.set(Time.zone.today.year - 1)
    continue
  end

  def future_date_of_death
    date = Time.zone.today + 1.month
    probate_page.content.probate_day_date_of_death.set(date.day)
    probate_page.content.probate_month_date_of_death.set(date.month)
    probate_page.content.probate_year_date_of_death.set(date.year)

    continue
  end
end
