@e2e

Feature: 61 or over page
  
  Scenario: Selecting yes to are you 61 years old or over?
    Given I am single, on the page for step five with £3,000 to £15,999 in savings
    When I submit yes I am 61 years old or over
    Then I am taken to step 6 - Do you receive any of the following benefits?

  Scenario: Entering a valid amount of savings that's within range
    Given I am single, on the page for step five with £3,000 to £15,999 in savings
    And I submit no to are you 61 years old or over
    And I enter £5000 as my savings and investments
    And I click continue
    Then I am taken to step 6 - Do you receive any of the following benefits?

  Scenario: Displays out of the range error message
    Given I am married, on the page for step five with £3,000 to £15,999 in savings
    When I submit no to are you 61 years old or over
    And I enter £1600 as our savings and investments
    And I click continue
    Then I should see enter amount between error message

  Scenario: Displays how much error message when left blank
    Given I am single, on the page for step five with £3,000 to £15,999 in savings
    When I submit no to are you 61 years old or over
    And I click continue
    Then I should see enter how much you have in savings and investments error message
    