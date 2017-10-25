@e2e

Feature: Step thirteen page

  Background: Navigating to the page for step thirteen
    Given I visit the page for step thirteen

  Scenario: Displays step number
    Then I should see step 13 of 20
  
  Scenario: Displays header
    Then I should see 'What is your National Insurance number?' header

  Scenario: Displays hint
    Then I should see hint 'For example, QQ123456C'

  Scenario: Entering a valid national insurance number
    When I enter a valid national insurance number
    Then I am taken to step 14 dob

  Scenario: If you don't know your national insurance number
    When I click on if you don't know your national insurance number
    Then I should see if you don't know your national insurance number copy

  Scenario: Displays error message enter a valid national insurance number
    When I enter a invalid national insurance number
    Then I should see 'Enter a valid National Insurance number' error message

  Scenario: Displays error message enter your national insurance number
    When I click continue
    Then I should see 'Enter your National Insurance number' error message
