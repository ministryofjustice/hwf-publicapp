Given(/^I am on the checklist page$/) do
  checklist_page.load_page
  expect(checklist_page).to be_displayed
  expect(checklist_page.content).to have_header
end

Then(/^I see that I need to make sure that I have my national insurance number$/) do
  expect(checklist_page.content).to have_list_item_ni
end

Then(/^if I do not have my national insurance number I can use the paper form$/) do
  expect(checklist_page.content).to have_use_paper_form
  expect(checklist_page.content.use_paper_form_link['href']).to end_with 'government/publications/apply-for-help-with-court-and-tribunal-fees'
end

When(/^I click on if you do not know your national insurance number$/) do
  checklist_page.content.do_not_know_ni.click
end

Then(/^I should see where I can find the number$/) do
  expect(checklist_page.content).to have_look_for_ni
end

Then(/^a link to receive a reminder in the post$/) do
  expect(checklist_page.content.reminder['href']).to end_with 'lost-national-insurance-number'
end

Then(/^I see that I need to make sure that I have the court or tribunal form number$/) do
  expect(checklist_page.content).to have_list_item_form_number
end

Then(/^I see that I need to make sure that I have the case number, claim number or notice to pay$/) do
  expect(checklist_page.content).to have_list_item_case_number
end

When(/^I continue$/) do
  continue
end

Then(/^I should be taken to form number page$/) do
  expect(form_name_page).to be_displayed
end
