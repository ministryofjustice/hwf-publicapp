Feature: Step fourteen page

  Background: Navigating to the page for step fourteen
    Given I visit the page for step fourteen

  Scenario: Displays step number
    Then I should see step '14' of 20
  
  Scenario: Displays header
    Then I should see 'What is your date of birth?' header

  Scenario: Displays hint
    Then I should see this format hint

  Scenario: Entering a valid date of birth
    When I enter a valid date of birth
    Then I am taken to step '15''personal_detail'

  Scenario: Displays you must be over 15 to use this service error message
    When I enter a date of less than fifteen years
    Then I should see 'You must be over 15 to use this service' error message

  Scenario: Displays check this date of birth is correct error message
    When I enter a invalid date of birth
    Then I should see 'Check this date of birth is correct' error message

  Scenario: Displays error message enter your national insurance number
    When I click continue
    Then I should see 'Enter the date in this format DD/MM/YYYY' error message
