class MaritalStatusPage < BasePage
  set_url '/questions/marital_status'

  section :content, '#content' do
    element :step_info, '.govuk-caption-l', text: 'Step 3 of 20'
    element :fee_header, 'h1', text: 'Are you single, married or living with someone and sharing an income?'
    element :single, 'label', text: 'Single'
    element :married, 'label', text: 'Married'
    element :help_choose_married, '.heading-small', text: 'Choose ‘married or living with someone'
    element :help_choose_single, '.heading-small', text: 'Choose ‘single’ if you rely on your own income'
    element :help_married, 'p', text: 'married'
    element :help_civil_partners, 'p', text: 'civil partners'
    element :help_living_together, 'p', text: 'living together as if you are married or in a civil partnership'
    element :help_same_address, 'p', text: 'living at the same address with a joint income'
    element :help_live_apart, 'p', text: 'a couple forced to live apart, eg where one or both'
    element :help_divorce, 'p', text: 'divorce, dissolution or annulment'
    element :help_gender, 'p', text: 'gender recognition'
    element :help_domestic_violence, 'p', text: 'domestic violence'
    element :help_forced_marriage, 'p', text: 'forced marriage'
    element :help_multiple_fee, 'p', text: 'you and your partner are both part of a multiple fee group'
  end

  def submit_single
    content.single.click
    continue
  end

  def submit_married
    content.married.click
    continue
  end

  def to_marital_status
    form_name_page.to_form_name
    form_name_page.submit_valid_form_number
    fee_page.submit_fee_yes
  end
end
