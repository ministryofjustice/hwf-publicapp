Given(/^I am a single person on step ten$/) do
  step 'I am on the page for step one - What court or tribunal fee do you need help with?'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as single'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I submit the form with no I do not have any children'
  step 'after selecting working tax credit from income list on step eight'
  step 'I click continue'
  step 'I select between'
end

Given(/^I am a married person on step ten$/) do
  step 'I am on the page for step one - What court or tribunal fee do you need help with?'
  step 'I submit the form with a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as married'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I submit the form with no I do not have any children'
  step 'after selecting wages from income list on step eight'
  step 'I click continue'
  step 'I select between'
end

And(/^I am on step ten$/) do
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
  step 'I submit the form as married'
  step 'I submit the form with £0 to £2,999 checked'
  step 'I submit the form with no I do not receive one of the benefits listed'
  step 'I submit the form with no I do not have any children'
  step 'after selecting wages from income list on step eight'
  step 'I click continue'
  step 'I select between'
end

When(/^I enter a valid total monthly income$/) do
  step_ten_page.content.form_group[0].income_amount.set(1900)
  common_page.continue_button.click
end

Then(/^I should see the income list on step ten page:$/) do |incomes|
  your_income = step_ten_page.content.text
  incomes.rows.each_with_index do |income, index|
    expect(your_income.li[index].text).to eq income[0]
  end
end
