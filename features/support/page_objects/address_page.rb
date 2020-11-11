class AddressPage < BasePage
  set_url '/questions/applicant_address'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 18 of 22'
    element :header, 'h1', text: 'What is your address?'
  end

  def submit_full_address
    fill_in 'Address', with: '102 Petty France, London'
    fill_in 'Postcode', with: 'SW1H 9AJ'
    continue
  end
end
