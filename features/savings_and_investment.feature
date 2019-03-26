@e2e

Feature: Savings and investment page

  Background: Navigating to the savings and investment page
    Given probate is enabled
    And I am a single person on the step four - How much do you have in savings and investments?

  Scenario: Selecting £0 to £2,999
    When I submit the form with £0 to £2,999 checked
    Then I am taken to step 6 - Do you receive any of the following benefits?

  Scenario: Selecting £3,000 to £15,999 
    When I submit the form with £3,000 to £15,999 checked
    Then I am taken to step 5 - Are you 61 years old or over?

  Scenario: Selecting £16,000 or more
    When I submit the form with £16,000 or more checked
    Then I am taken to step 6 - Do you receive any of the following benefits?

  Scenario: Help with savings and investments
    When I click on 'Help with savings and investments'
    Then I should see help with savings and investments copy
