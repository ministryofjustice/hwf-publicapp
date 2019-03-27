@e2e

Feature: National insurance page

  Background: Navigating to the page for step thirteen
    Given probate is enabled
    And I visit the page for step thirteen - What is your National Insurance number?

  Scenario: Entering a valid national insurance number
    When I enter a valid national insurance number
    Then I am taken to step 14 - What is your date of birth?

  Scenario: If you don't know your national insurance number
    When I click on if you don't know your national insurance number
    Then I should see if you don't know your national insurance number copy

  Scenario: Displays error message enter a valid national insurance number
    When I enter a invalid national insurance number
    Then I should see enter a valid National Insurance number error message

  Scenario: Displays error message enter your national insurance number
    When I click continue
    Then I should see enter your National Insurance number error message
