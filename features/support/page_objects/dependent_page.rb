class DependentPage < BasePage
  section :content, '#content' do
    element :step_info, '.step-info', text: 'Step 7 of 20'
    element :dependent_header, 'h1', text: 'Do you have any children living with you, or who you support financially?'
    element :no, '.block-label', text: 'No'
    element :yes, '.block-label', text: 'Yes'
    element :num_of_children, '.form-label', text: 'Number of children'
    element :children_number, '#dependent_children_number'
    element :details_content, '#details-content-0'
    element :give_details, 'p', text: 'You need to give details of any children you support financially.'
    element :includes_children, 'p', text: 'This includes children who are:'
    element :children_under, 'li', text: 'under 16 and living at home with you'
    element :children_between, 'li', text: 'between 16 – 19, single, living at home with you and in full-time education (not including studying for a degree or other higher education qualification). See '
    element :regular_maintenance, 'li', text: 'a child who doesn’t live with you, but you (or your partner) pay regular maintenance for them'
    element :child_tax_link, 'a', text: 'gov.uk/child-tax-credit-when-child-reaches-16'
    element :error_link, 'a', text: 'You need to say whether you have financially dependent children'
    element :error_message, '.error-message', text: 'You need to say whether you have financially dependent children'
  end
end
