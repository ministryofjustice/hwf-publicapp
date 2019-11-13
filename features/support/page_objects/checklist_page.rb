class ChecklistPage < BasePage
  set_url '/checklist'

  section :content, '#content' do
    element :header, 'h1', text: 'What you will need'
    element :list_item_ni, 'li', text: 'your National Insurance number'
    element :list_item_form_number, 'li', text: 'the court or tribunal form number'
    element :list_item_case_number, 'li', text: 'your case number, claim number or notice to pay - if you have one'
    element :use_paper_form, 'p', text: 'If you don\'t have a National Insurance number, you need to '
    element :use_paper_form_link, 'a', text: 'use the paper form'
    element :do_not_know_ni, 'summary', text: 'If you don’t know your National Insurance number'
    element :look_for_ni, 'li', text: 'look for your National Insurance number on payslips or official letters about tax, pensions or benefits'
    element :reminder, 'a', text: 'ask for a reminder through the post'
  end
end
