Feature: Step nine page

  Scenario: Displays step number
    Given I am a single person with no children on step nine
    Then I should see step 9 of 20
  
  Scenario: Displays single person header
    Given I am a single person with no children on step nine
    Then I should see 'How much income do you receive each month?' header

  Scenario: Displays married person header
    Given I am a married person with no children on step nine
    Then I should see 'How much income do you and your partner receive each month?' header

  Scenario: Income list
    Given I am a single person with no children on step nine
    And I should see the income list on step nine page:
      | income name                                               |
      | Wages                                                     |
      | Working Tax Credit                                        |

  Scenario: Displays average monthly income copy
    Given I am a single person with no children on step nine
    Then I should see average monthly income copy

  Scenario: Income range for single with no children
    Given I am a single person with no children on step nine
    Then I should see low income range 'Less than £1,085'
    And I should see medium income range 'Between £1,085 and £5,085'
    And I should see high income range 'More than £5,085'

  Scenario: Income range for married with three children
    Given I am a married person with three children on step nine
    Then I should see low income range 'Less than £1,980'
    And I should see medium income range 'Between £1,980 and £5,980'
    And I should see high income range 'More than £5,980'

  Scenario: Income range for single with three children
    Given I am a single person with three children on step nine
    Then I should see low income range 'Less than £1,820'
    And I should see medium income range 'Between £1,820 and £5,820'
    And I should see high income range 'More than £5,820'

  Scenario: Selecting the less than range
    Given I am a single person with no children on step nine
    When I select less than
    Then I am taken to step 11 - Are you paying a fee for a probate case?

  Scenario: Selecting the between range
    Given I am a single person with no children on step nine
    When I select between
    Then I am taken to step 10 - What’s your total monthly income?

  Scenario: Selecting the more than range
    Given I am a single person with no children on step nine
    When I select more than
    Then I am taken to step 11 - Are you paying a fee for a probate case?

  Scenario: Displays error message
    Given I am a single person with no children on step nine
    When I click continue
    Then I should see 'Select your monthly income' error message

