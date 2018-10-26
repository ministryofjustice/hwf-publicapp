@e2e

Feature: Savings and investment page

  Scenario: Selecting £0 to £2,999
    Given I am a single person on the step four - How much do you have in savings and investments?
    When I submit the form with £0 to £2,999 checked
    Then I am taken to step 6 - Do you receive any of the following benefits?

  Scenario: Selecting £3,000 to £15,999
    Given I am a single person on the step four - How much do you have in savings and investments?
    When I submit the form with £3,000 to £15,999 checked
    Then I am taken to step 5 - Are you 61 years old or over?

  Scenario: Selecting £16,000 or more
    Given I am a single person on the step four - How much do you have in savings and investments?
    When I submit the form with £16,000 or more checked
    Then I am taken to step 6 - Do you receive any of the following benefits?

  Scenario: Help with savings and investments
    Given I am a single person on the step four - How much do you have in savings and investments?
    When I click on 'Help with savings and investments'
    Then I should see help with savings and investments copy
