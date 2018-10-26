Feature: Date of birth page

  Background: Navigating to the date of birth page
    Given I visit the page for step fourteen - What is your date of birth?

  Scenario: Entering a valid date of birth
    When I enter a valid date of birth
    Then I am taken to step 15 - What is your full name?

  Scenario: Displays you must be over 15 to use this service error message
    When I enter a date of less than fifteen years
    Then I should see you must be over 15 to use this service error message

  Scenario: Displays check this date of birth is correct error message
    When I enter a invalid date of birth
    Then I should see check this date of birth is correct error message

  Scenario: Displays error message enter your national insurance number
    When I click continue
    Then I should see enter the date in this format error message
