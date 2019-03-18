@e2e

Feature: Savings and investment page

  Scenario: Selecting £0 to £2,999
    Given I am a single person on the savings and investments page
    When I submit the form with £0 to £2,999 checked
    Then I should be taken to benefits page

  Scenario: Selecting £3,000 to £15,999
    Given I am a married person on the savings and investments page
    When I submit the form with £3,000 to £15,999 checked
    Then I should be taken to savings and investment extra page

  Scenario: Selecting £16,000 or more
    Given I am a single person on the savings and investments page
    When I submit the form with £16,000 or more checked
    Then I should be taken to benefits page

  Scenario: Help with savings and investments
    Given I am a single person on the savings and investments page
    When I click on 'Help with savings and investments'
    Then I should see help with savings and investments copy
