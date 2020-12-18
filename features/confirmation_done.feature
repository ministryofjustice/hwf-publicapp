@hwf_submit_application

Feature: Confirmation done page

  Background: Navigating to the confirmation done page
    Given I am on the confirmation done page with probate enabled

  Scenario: Displays deliver your paperwork instructions
    Then I should see deliver your paperwork instructions

  Scenario: Displays what happens next
    Then I should see what happens next

  Scenario: Save or print this page
    Then I should see save or print this page

  @smoke
  Scenario: Finish application
    When I click the finish application button
    Then I should be taken to the thank you page
