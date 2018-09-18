And(/^I am single, on the page for step five with £3,000 to £15,999 in savings$/) do
  answer_up_to_over_61_single
  over_61_page.content.single_header
end

And(/^I am married, on the page for step five with £3,000 to £15,999 in savings$/) do
  answer_up_to_over_61_married
  over_61_page.content.married_header
end

When(/^I submit yes I am 61 years old or over$/) do
  over_61_page.content.yes.click
  continue
end

When(/^I submit no to are you 61 years old or over$/) do
  over_61_page.content.no.click
end

When(/^I enter £5000 as my savings and investments$/) do
  expect(over_61_page.content).to have_how_much_label_single
  over_61_page.content.extra_amount.set(5000)
end

When(/^I enter £1600 as our savings and investments$/) do
  expect(over_61_page.content).to have_how_much_label_married
  over_61_page.content.extra_amount.set(1600)
end

Then(/^I should see enter amount between error message$/) do
  expect(over_61_page.content).to have_error_message
  expect(over_61_page.content).to have_error_link
end

Then(/^I should see enter how much you have in savings and investments error message$/) do
  expect(over_61_page.content).to have_blank_error_message
  expect(over_61_page.content).to have_blank_error_link
end