class StepFourPage < BasePage
  section :content, '#content' do
    element :married_reminder, '.text', text: 'Remember to include your partner’s savings and investments in your total.'
    sections :form_group, '.form-group' do
      element :low_amount, '.block-label', text: '£0 to £2,999'
      element :medium_amount, '.block-label', text: '£3,000 to £15,999'
      element :high_amount, '.block-label', text: '£16,000 or more'
      element :help_include, '.text', text: 'What to include in savings and investments:'
      element :help_isa, '.text', text: 'money in ISAs and any other savings account'
      element :help_savings, '.text', text: 'joint savings accounts that you share with your partner'
      element :help_bonds, '.text', text: 'fixed rate or investment bonds'
      element :help_lump_sum, '.text', text: 'any lump sum (eg a redundancy payout)'
      element :help_stocks_shares, '.text', text: 'stocks and shares'
      element :help_trust_funds, '.text', text: 'trust funds (or any other kind of fund)'
      element :help_homes, '.text', text: 'second homes'
      element :help_property, '.text', text: 'any money or property outside the UK'
      element :help_exclude, '.text', text: 'Don’t include the following in your savings total:'
      element :help_wages, '.text', text: 'wages or benefits'
      element :help_savings, '.text', text: 'joint savings accounts that you share with your partner'
      element :help_capital, '.text', text: 'capital value of self-employed businesses'
      element :help_student_loans, '.text', text: 'student loans'
      element :help_dismissal, '.text', text: 'unfair dismissal awards'
      element :help_injury, '.text', text: 'money from the criminal injury compensation scheme'
      element :help_medical_negligence, '.text', text: 'medical negligence or personal injury awards'
      element :help_compensation, '.text', text: 'any compensation under a statutory scheme in respect of Mesothelioma'
      element :savings_and_investment_choice_less, '#savings_and_investment_choice_less'
      element :savings_and_investment_choice_between, '#savings_and_investment_choice_between'
      element :savings_and_investment_choice_more, '#savings_and_investment_choice_more'
    end
  end
end
