@e2e

Feature: Income amount page

  Scenario: Submits monthly income
    Given I am a single person on step ten - Whats your total monthly income?
    When I submit the form with my monthly income
    Then I am taken to step 12 - Do you have a case, claim or ‘notice to pay’ number?

  Scenario: Income list
    Given I am a married person on step ten - Whats your total monthly income?
    And I should see the income list on step ten page:
      | income name                                               |
      | Wages                                                     |

  Scenario: Displays error message
    Given I am a married person on step ten - Whats your total monthly income?
    When I click continue
    Then I should see enter how much income do you receive error message
