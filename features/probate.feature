Feature: Probate page

  Background: Navigating to the probate page
    Given probate is enabled
    And I visit the page for step eleven - Are you paying a fee for a probate case?

  Scenario: Selecting no to are you paying a fee for a probate case
    When I select no to are you paying a fee for a probate case
    Then I am taken to step 12 - Do you have a case, claim or ‘notice to pay’ number?

  Scenario: Selecting yes to are you paying a fee for a probate case
    When I select yes to are you paying a fee for a probate case
    And I enter the name of deceased
    And I enter a valid date of death
    Then I am taken to step 12 - Do you have a case, claim or ‘notice to pay’ number?

  Scenario: Displays date can't be in the future error message
    When I enter a future date of death
    Then I should see error message this date can't be in the future

  Scenario: Displays must have been in the last 20 years error message
    When I enter a date over twenty years ago
    Then I should see error message the date of death must have been in the last 20 years

  Scenario: Displays invalid format error message
    When I enter a invalid date of death
    Then I should see enter the date in this format error message

  Scenario: Displays make a selection error message
    When I click continue
    Then I should see select whether you're paying a fee for a probate case error message
