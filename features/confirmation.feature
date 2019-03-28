@hwf_submit_application @e2e

Feature: Confirmation page

  Background: Navigating to the confirmation page
    Given I am on the confirmation page with probate enabled

  Scenario: Displays step number
    Then I see step 19 of 20
  
  Scenario: Displays header
    Then I should see header 'Your application for help with fees is not finished yet'

  Scenario: Displays directions
    Then I should see direction points 1 to 4

  Scenario: Save or print this page
    Then I should see save or print this page

  Scenario: Continue to step twenty
    When I click continue
    Then I should be taken to the confirmation done page
