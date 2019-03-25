class AddressPage < BasePage
  set_url '/questions/applicant_address'

  element :address, '#applicant_address_address'
  element :postcode, '#applicant_address_postcode'
  elements :form_group, '.form-group'
end
