class StepThreePage < BasePage
  section :content, '#content' do
    sections :form_group, '.form-group' do
      element :single, '.block-label', text: 'Single'
      element :married, '.block-label', text: 'Married'
      element :marital_status_married_false, '#marital_status_married_false'
      element :marital_status_married_true, '#marital_status_married_true'
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
  end
end
