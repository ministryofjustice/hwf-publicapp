class PersonalDetailsPage < BasePage
  set_url '/questions/personal_detail'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 17 of 22'
    element :header, 'h1', text: 'What is your full name?'
    element :optional_hint, '.optional', text: 'Optional'
  end

  def submit_full_name
    fill_in 'Title(Optional)', with: 'Ms'
    fill_in 'First name', with: 'Sally'
    fill_in 'Last name', with: 'Smith'
    continue
  end

  def fillTitle(str)
    fill_in 'Title(Optional)', with: str
  end

  def fillFName(str)
    fill_in 'First name', with: str
  end

  def fillLName(str)
    fill_in 'Last name', with: str
  end
end
