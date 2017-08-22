And(/^I have no children$/) do
  step 'I select no to have you already paid the fee?'
  step 'I select single'
  step 'I select £0 to £2,999'
  step 'I select no to do you receive any of the following benefits?'
  step 'I select no to do you have any children'
end

And(/^I have no income$/) do
    expect(saucelabs_page.no_income.text).to eq 'No income'
    saucelabs_page.no_income.click
end

And(/^I submit my application$/) do
  step 'I click continue'
  step 'I select between'
  step 'I enter a valid total monthly income'
  step 'I select no to are you paying a fee for a probate case'
  step 'I select no to do you have a case, claim or notice to pay number'
  step 'I enter a valid national insurance number'
  step 'I enter a valid date of birth'
  step 'I enter my full name'
  step 'I enter my address with postcode'
  step 'I click continue'
  step 'I click submit application and continue'
  step 'I press the continue button'
end

