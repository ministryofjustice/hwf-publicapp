class HomeOfficePage < BasePage
  set_url '/questions/home_office?locale=en'

  section :content, '#content' do
    element :header, 'h1'
    element :step_info, '.govuk-caption-l'
  end
end
