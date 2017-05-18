Feature: Step two page

  Background: Navigating to the page for step two
    Given I visit the page for step two

  Scenario: Displays step number
    Then I should see step '2' of 20

  Scenario: Displays header
    Then I should see the step two header

  Scenario: Displays hint
    Then I should see step two hint

  Scenario: Neither selecting yes or no
    When I click the continue button
    Then I should see error message prompting me to make a selection

  Scenario: Selecting no to have you already paid the fee?
    When I select no to have you already paid the fee?
    Then I am taken to step three

  Scenario: Selecting yes but not providing a date
    When I select yes to have you already paid the fee?
    And I click the continue button
    Then I should see error message prompting a date

  Scenario: Date within the last 3 months
    When I select yes to have you already paid the fee?
    And the date I enter is within the last three months
    Then I am taken to step three

  Scenario: Date exceeding 3 months
    When I select yes to have you already paid the fee?
    And the date I enter exceeds three months
    Then I should see date exceeding 3 months error message

  Scenario: Date is in the future
    When I select yes to have you already paid the fee?
    And the date I enter is in the future
    Then I should see date can't be in the future error message
