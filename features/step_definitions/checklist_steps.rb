Given(/^I am on the checklist page$/) do
  checklist_page.load_page
  expect(checklist_page).to be_displayed
  expect(checklist_page.content).to have_header
end

Then(/^I see that I need my national insurance number or home office number$/) do
  expect(checklist_page.content).to have_list_item_ni_number
  expect(checklist_page.content).to have_list_item_ho_number
end

Then(/^if I do not have a national insurance or home office number then I can use the paper form$/) do
  expect(checklist_page.content).to have_use_paper_form
  expect(checklist_page.content.use_paper_form_link['href']).to end_with '/government/uploads/system/uploads/attachment_data/file/508760/ex160-eng-20160212.pdf'
end

When(/^I click on if you do not know your national insurance number$/) do
  expect(checklist_page.content.do_not_know[0].text).to eq "If you don’t know your National Insurance number"
  checklist_page.content.do_not_know[0].click
end

Then(/^I should see where I can find my national insurance number$/) do
  expect(checklist_page.content).to have_look_for_ni
end

When(/^I click on if you do not know your home office number$/) do
  expect(checklist_page.content.do_not_know[1].text).to eq "If you don't know your Home Office reference number"
  checklist_page.content.do_not_know[1].click
end

Then(/^I should see where I can find my home office number$/) do
  expect(checklist_page.content).to have_look_for_ho
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
  checklist_continue
end

Then(/^I should be taken to form number page$/) do
  expect(form_name_page).to be_displayed
end
