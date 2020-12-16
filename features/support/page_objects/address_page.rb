class AddressPage < BasePage
  set_url '/questions/applicant_address'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 18 of 22'
    element :header, 'h1', text: 'What is your address?'
  end

  def submit_full_address
    address_page.fillInAddress('102 Petty France, London')
    address_page.fillInPostCode('SW1H 9AJ')
    continue
  end

  def fillInAddress(str)
    fill_in 'Address', with: str
  end

  def fillInPostCode(str)
    fill_in 'Postcode', with: str
  end
end
