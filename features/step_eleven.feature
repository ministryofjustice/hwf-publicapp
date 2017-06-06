Feature: Step eleven page

  Background: Navigating to the page for step eleven
    Given I visit the page for step eleven

  Scenario: Displays step number
    Then I should see step '11' of 20
  
  Scenario: Displays header
    Then I should see 'Are you paying a fee for a probate case?' header

  Scenario: Displays hint
    Then I should see hint 'property and belongings of someone who has died.'

  Scenario: Selecting no to are you paying a fee for a probate case
    When I select no to are you paying a fee for a probate case
    Then I am taken to step twelve

  Scenario: Selecting yes to are you paying a fee for a probate case
    When I select yes to are you paying a fee for a probate case
    And I enter the name of deceased
    And I enter a valid date of death
    Then I am taken to step twelve

  Scenario: Displays date can't be in the future error message
    When I enter a future date of death
    Then I should see error message 'This date can't be in the future'

  Scenario: Displays invalid format error message
    When I select yes to are you paying a fee for a probate case
    And I enter the name of deceased
    And I enter a invalid date of death
    Then I should see error message 'Enter the date in this format DD/MM/YYYY'

  Scenario: Displays make a selection error message
    When I click the continue button on step eleven
    Then I should see 'Select whether you're paying a fee for a probate case' error message
