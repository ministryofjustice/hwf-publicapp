@e2e

Feature: Step six page

  Background: Page six
    Given I am on the page for step six

  Scenario: Displays step number
    Then I should see step 6 of 20
  
  Scenario: Displays header
    Then I should see 'Do you receive any of the following benefits?' header

  Scenario: Displays benefits list
    Then I should see the benefits list:
    | benefit                                                                                 |
    | Income-based Jobseeker’s Allowance (JSA)                                                |
    | Income-related Employment and Support Allowance (ESA)                                   |
    | Income Support                                                                          |
    | Universal Credit (and you’re earning less than £6,000 a year)                           |
    | Pension Credit (Guarantee Credit)                                                       |
    | Scottish Civil Legal Aid (not Advice and Assistance or Advice by Way of Representation) |

  Scenario: No I am not receiving any benefits from list
    When I submit the form with no I do not receive one of the benefits listed
    Then I am taken to step 7 - Do you have any children living with you, or who you support financially?

  Scenario: Yes I am receiving benefits from list
    When I submit the form with yes I am receiving one of the benefits listed
    Then I am taken to step 11 - Are you paying a fee for a probate case?

  Scenario: Displays error message
    When I click continue
    Then I should see 'Select whether you're receiving one of the benefits listed' error message

  Scenario: Help with benefits
    When I click on 'Help with benefits'
    Then I should see help with benefits copy
