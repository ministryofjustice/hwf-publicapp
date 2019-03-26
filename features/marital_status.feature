@e2e

Feature: Marital status page

  Background: Navigating to the marital status page
    Given probate is enabled
    And I am on the page for step three - Are you single, married or living with someone and sharing an income?

  Scenario: Selecting single
    When I submit the form as single
    Then I am taken to step 4 - How much do you have in savings and investments?

  Scenario: Selecting married
    When I submit the form as married
    Then I am taken to step 4 - How much do you have in savings and investments?

  Scenario: Help with status
    When I click on 'Help with status'
    Then I should see help with status copy