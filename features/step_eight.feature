@e2e

Feature: Step eight page

  Scenario: Displays step number
    Given I am a single person on step eight
    Then I should see step 8 of 20
  
  Scenario: Displays single person header
    Given I am a single person on step eight
    Then I should see 'What kind of income do you receive?' header

  Scenario: Displays married person header
    Given I am a married person on step eight
    Then I should see 'What kind of income do you and your partner receive?' header

  Scenario: Displays single person hint
    Given I am a single person on step eight
    Then I should see single person hint 'Choose the different types of income you receive.'

  Scenario: Displays married person hint
    Given I am a married person on step eight
    Then I should see married person hint 'Choose the different types of income you and your partner receive.'

  Scenario: Displays income lists for a single person
    Given I am a single person on step eight
    Then I should see an income list:
      | income name                                               |
      | Wages                                                     |
      | Child Benefit                                             |
      | Working Tax Credit                                        |
      | Child Tax Credit                                          |
      | Maintenance payments                                      |
      | Contribution-based Jobseekers Allowance (JSA)             |
      | Contribution-based Employment and Support Allowance (ESA) |
      | Universal Credit                                          |
      | Pensions (state, work, private)                           |
      | Rent from anyone living with you                          |
      | Rent from other properties you own                        |
      | Other monthly income                                      |
      | No income                                                 |

  Scenario: Displays income lists for a couple
    Given I am a married person on step eight
    Then I should see an income list for myself and my partner:
      | income name                                               |
      | Wages                                                     |
      | Child Benefit                                             |
      | Working Tax Credit                                        |
      | Child Tax Credit                                          |
      | Maintenance payments                                      |
      | Contribution-based Jobseekers Allowance (JSA)             |
      | Contribution-based Employment and Support Allowance (ESA) |
      | Universal Credit                                          |
      | Pensions (state, work, private)                           |
      | Rent from anyone living with you                          |
      | Rent from other properties you own                        |
      | Other monthly income                                      |
      | No income                                                 |

  Scenario: No income
    Given I am a single person on step eight
    When I select no income
    Then I am taken to step 11 - Are you paying a fee for a probate case?

  Scenario: Displays error message
    Given I am a single person on step eight
    When I click continue
    Then I should see 'Select your kinds of income' error message
