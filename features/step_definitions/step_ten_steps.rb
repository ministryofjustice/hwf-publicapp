Given(/^I am a single person on step ten$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
  step 'after selecting working tax credit from income list on step eight'
  step 'I click continue'
  step 'I select between'
end

Given(/^I am a married person on step ten$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
  step 'I select no to have you already paid the fee?'
  step 'I select married'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
  step 'after selecting wages from income list on step eight'
  step 'I click the continue button'
  step 'I select between'
end

Given(/^I do not need help with an employment tribunal$/) do
  step 'I visit the page for step one'
  step 'I enter a valid form number'
end

And(/^I am on step ten$/) do
  step 'I select no to have you already paid the fee?'
  step 'I select married'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
  step 'after selecting wages from income list on step eight'
  step 'I click the continue button'
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
