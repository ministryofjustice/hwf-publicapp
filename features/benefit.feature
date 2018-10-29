@e2e

Feature: Benefit page

  Background: Navigating to the benefit page
    Given I am on the page for step six - Do you receive any of the following benefits?

  Scenario: Displays instruction bullet points
    Then I should see the instruction bullet points:
    | benefit                                                                                                                   |
    | If you are receiving one of the benefits listed in column 1, select ‘Yes’.                                                |
    | There are some benefits with similar names listed in column 2. If you are receiving one of these benefits, select 'No'.   |
    | If you are not receiving any of benefits listed on this page, select 'No'.                                                |

  Scenario: Displays benefits table
    Then I should see the benefits table:
    | Income-based Jobseeker’s Allowance (JSA)                                                | Contribution-based Job Seekers Allowance (JSA)                                       |
    | Income-related Employment and Support Allowance (ESA)                                   | Contribution-based Employment and Support Allowance (ESA)                            |
    | Pension Credit (Guarantee Credit)                                                       | Pension Credit and Savings Credit                                                    |
    | Universal Credit (and you’re earning less than £6,000 a year)                           | Universal Credit (and you're earning £6,000 or more a year)                          |
    | Scottish Civil Legal Aid (not Advice and Assistance or Advice by Way of Representation) | Scottish Legal Aid (Advice and Assistance or Advice by Way of Representation ABWOR)  |
    | Income Support                                                                          ||


  Scenario: No I am not receiving any benefits from list
    When I submit the form with no I do not receive one of the benefits listed
    Then I am taken to step 7 - Do you have any children living with you, or who you support financially?

  Scenario: Yes I am receiving benefits from list
    When I submit the form with yes I am receiving one of the benefits listed
    Then I am taken to step 11 - Are you paying a fee for a probate case?

  Scenario: Displays error message
    When I click continue
    Then I should see select whether you're receiving one of the benefits listed error message
