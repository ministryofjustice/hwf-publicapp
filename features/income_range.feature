Feature: Step nine page   

  Scenario: Income list
    Given I am a single person with no children on step nine - What kind of income do you receive?
    And I should see the income list on step nine page:
      | income name                                               |
      | Wages                                                     |
      | Working Tax Credit                                        |

  Scenario: Income range for single with no children
    Given I am a single person with no children on step nine - What kind of income do you receive?
    Then I should see low income range 'Less than £1,085'
    And I should see medium income range 'Between £1,085 and £5,085'
    And I should see high income range 'More than £5,085'

  Scenario: Income range for married with three children
    Given I am a married person with three children on step nine - What kind of income do you receive?
    Then I should see low income range 'Less than £1,245'
    And I should see medium income range 'Between £1,245 and £5,245'
    And I should see high income range 'More than £5,245'

  Scenario: Income range for single with three children
    Given I am a single person with three children on step nine - What kind of income do you receive?
    Then I should see low income range 'Less than £1,820'
    And I should see medium income range 'Between £1,820 and £5,820'
    And I should see high income range 'More than £5,820'

  Scenario: Selecting the less than range
    Given I am a single person with no children on step nine - What kind of income do you receive?
    When I select less than
    Then I am taken to step 11 - Are you paying a fee for a probate case?

  Scenario: Selecting the between range
    Given I am a single person with no children on step nine - What kind of income do you receive?
    When I select between
    Then I am taken to step 10 - What’s your total monthly income?

  Scenario: Selecting the more than range
    Given I am a single person with no children on step nine - What kind of income do you receive?
    When I select more than
    Then I am taken to step 11 - Are you paying a fee for a probate case?

  Scenario: Displays error message
    Given I am a single person with no children on step nine - What kind of income do you receive?
    When I click continue
    Then I should see select your monthly income error message

