@e2e

Feature: Step three page

  Background: Navigating to the page for step three
    Given I visit the page for step three

  Scenario: Displays step number
    Then I should see step 3 of 20

  Scenario: Displays header
    Then I should see 'Are you single, married or living with someone and sharing an income?' header

  Scenario: Selecting single
    When I select single
    Then I am taken to step 4 savings_and_investment

  Scenario: Selecting married
    When I select married
    Then I am taken to step 4 savings_and_investment

  Scenario: Help with status
    When I click on help with 'status'
    Then I should see help with status copy