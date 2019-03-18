class MaritalStatusPage < BasePage
  set_url '/questions/marital_status'

  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 3 of 20'
    element :fee_header, 'h1', text: 'Are you single, married or living with someone and sharing an income?'
    element :single, '.block-label', text: 'Single'
    element :married, '.block-label', text: 'Married'
    element :help_choose_married, '.heading-small', text: 'Choose ‘married or living with someone'
    element :help_choose_single, '.heading-small', text: 'Choose ‘single’ if you rely on your own income'
    element :help_married, '.text', text: 'married'
    element :help_civil_partners, '.text', text: 'civil partners'
    element :help_living_together, '.text', text: 'living together as if you are married or in a civil partnership'
    element :help_same_address, '.text', text: 'living at the same address with a joint income'
    element :help_live_apart, '.text', text: 'a couple forced to live apart, eg where one or both'
    element :help_divorce, '.text', text: 'divorce, dissolution or annulment'
    element :help_gender, '.text', text: 'gender recognition'
    element :help_domestic_violence, '.text', text: 'domestic violence'
    element :help_forced_marriage, '.text', text: 'forced marriage'
    element :help_multiple_fee, '.text', text: 'you and your partner are both part of a multiple fee group'
  end

  def single
    marital_status_page.content.single.click
    common_page.continue_button.click
  end

  def married
    marital_status_page.content.married.click
    common_page.continue_button.click
  end
end
