Feature: Step two page

  Background: Navigating to the page for step two
    Given I visit the page for step two

  Scenario: Displays step number
    Then I should see step 2 of 20

  Scenario: Displays header
    Then I should see 'Have you already paid the fee?' header

  Scenario: Displays hint
    Then I should see step two hint

  Scenario: Neither selecting yes or no
    When I click continue
    Then I should see 'Select whether you've already paid the fee' error message

  Scenario: Selecting no to have you already paid the fee?
    When I select no to have you already paid the fee?
    Then I am taken to step 3 marital_status

  Scenario: Selecting yes but not providing a date
    When I select yes to have you already paid the fee?
    And I click continue
    Then I should see 'Enter the date in this format DD/MM/YYYY' error message

  Scenario: Date within the last 3 months
    When I select yes to have you already paid the fee?
    And the date I enter is within the last three months
    Then I am taken to step 3 marital_status

  Scenario: Date exceeding 3 months
    When I select yes to have you already paid the fee?
    And the date I enter exceeds three months
    Then I should see 'The application must have been made in the last 3 months' error message

  Scenario: Date is in the future
    When I select yes to have you already paid the fee?
    And the date I enter is in the future
    Then I should see 'This date can't be in the future' error message
