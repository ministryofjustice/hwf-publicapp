Feature: Step ten page

  Scenario: Displays step number
    Given I am a single person on step ten
    Then I should see step 10 of 20

  Scenario: Displays header
    Given I am a single person on step ten
    Then I should see 'What’s your total monthly income?' header

  Scenario: Displays single person hint
    Given I am a single person on step ten
    Then I should see single person hint 'Enter the total monthly amount you receive in income from:'

  Scenario: Displays married person hint
    Given I am a married person on step ten
    Then I should see married person hint 'monthly amount you and your partner receive in income from:'

  Scenario: Displays average monthly income copy
    Given I am a single person on step ten
    Then I should see average monthly income copy

  Scenario: Income list
    Given I am a married person on step ten
    And I should see the income list on step ten page:
      | income name                                               |
      | Wages                                                     |

  Scenario: No help with an employment tribunal
    Given I do not need help with an employment tribunal
    And I am on step ten
    When I enter a valid total monthly income
    Then I am taken to step 11 probate

  Scenario: Displays error message
    Given I am a single person on step ten
    When I click continue
    Then I should see 'Enter how much income do you receive' error message
