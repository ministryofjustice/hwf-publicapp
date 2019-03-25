@hwf_submit_application @e2e

Feature: Confirmation done page

  Background:
    Given I am on the confirmation done page with probate enabled

  Scenario: Displays header for people that do not need help with an employment tribunal fee
    Then I should see header 'Send your C100 form with your HWF-000-000 reference'

  Scenario: Displays deliver your paperwork copy
    Then I should see deliver your paperwork copy

  Scenario: Displays what happens next for people that do not need help with an employment tribunal fee
    Then I should see what happens next

  Scenario: Save or print this page
    Then I should see save or print this page

  Scenario: Finish application
    When I click the finish application button
    Then I am taken to the thank you page
