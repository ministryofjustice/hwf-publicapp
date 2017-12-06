class StepSevenPage < BasePage
  section :content, '#content' do
    sections :form_group, '.form-group' do
      element :no, '.block-label', text: 'No'
      element :yes, '.block-label', text: 'Yes'
      element :dependent_children_true, '#dependent_children_true'
      element :num_of_children, '.form-label', text: 'Number of children'
      element :children_number, '#dependent_children_number'
      element :dependent_children_false, '#dependent_children_false'
      element :details_content, '#details-content-0'
    end
    element :give_details, '.text', text: 'You need to give details of any children you support financially.'
    element :includes_children, '.text', text: 'This includes children who are:'
    element :children_under, '.text', text: 'under 16 and living at home with you'
    element :children_between, '.text', text: 'between 16 – 19, single, living at home with you and in full-time education (not including studying for a degree or other higher education qualification). See '
    element :regular_maintenance, '.text', text: 'a child who doesn’t live with you, but you (or your partner) pay regular maintenance for them'
    element :child_tax_link, 'a', text: 'gov.uk/child-tax-credit-when-child-reaches-16'
  end
end
