class ConfirmationDonePage < BasePage
  set_url '/confirmation/done'

  section :post, '.post' do
    element :p, 'p'
  end
  section :steps_panel, '.steps-panel' do
    element :h2, 'h2'
    elements :li, 'ol > li'
  end
  sections :li, 'li' do
    section :inset, '.inset' do
      elements :li, 'ul > li'
    end
  end
  sections :column_half, '.column-half' do
    element :heading_small, '.heading-small'
    section :ul, 'ul' do
      section :email, '.email' do
        elements :li, 'ul > li'
      end
      section :postal_address, '.postal-address' do
        elements :li, 'ul > li'
      end
    end
  end
  sections :list, '.list' do
    elements :li, 'li'
  end
  element :finish_application_button, 'input[value="Finish application"]'

  def to_confirmation_done_page
    form_name_page.load_page
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
    marital_status_page.submit_married
    savings_investment_page.low_amount_checked
    benefit_page.submit_benefit_yes
    probate_page.submit_probate_no
    claim_page.submit_claim_no
    national_insurance_page.submit_valid_ni
    dob_page.valid_dob
    personal_details_page.submit_full_name
    address_page.submit_full_address
    contact_page.valid_email
    summary_page.submit_application
    confirmation_page.finish_application
  end
end
