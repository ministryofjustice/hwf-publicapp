@hwf_submit_application @e2e

Feature: Confirmation page

  Background: Navigating to the confirmation page
    Given I am on the confirmation page with probate enabled

  Scenario: Displays instructions
    Then I should see instruction points

  Scenario: Displays letter template
    When I see letter template
    Then I should see reference number

  Scenario: Displays warning message
    Then I should see warning notice

  Scenario: Save or print this page
    Then I should see save or print this page

  Scenario: Finish application
    When I click finish application
    Then I should be taken to the confirmation done page
