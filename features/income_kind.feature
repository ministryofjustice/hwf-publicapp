@e2e

Feature: Income kind page

  Scenario: Displays income lists for a single person
    Given probate is enabled
    When I am a single person on step eight - What kind of income do you receive?
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
    Given probate is enabled 
    And I am a married person on step eight - What kind of income do you receive?
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

  Scenario: No income - probate enabled
    Given probate is enabled
    And I am a single person on step eight - What kind of income do you receive?
    When I submit the form with no income checked
    Then I am taken to step 11 - Are you paying a fee for a probate case?

  Scenario: No income - probate disabled
    Given probate is disabled
    And I am a single person on step eight - What kind of income do you receive?
    When I submit the form with no income checked
    Then I am taken to step 12 - Do you have a case, claim or ‘notice to pay’ number?

  Scenario: Displays error message
    Given probate is enabled
    And I am a single person on step eight - What kind of income do you receive?
    When I click continue
    Then I should see select your kinds of income error message
