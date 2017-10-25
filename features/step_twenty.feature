@hwf_submit_application @e2e

Feature: Step twenty page

  Scenario: Displays step number
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I see step 20 of 20

  Scenario: Displays header for people that do not need help with an employment tribunal fee
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I should see header 'Send your C100 form with your HWF-000-000 reference'

  Scenario: Displays deliver your paperwork copy
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I should see deliver your paperwork copy

  Scenario: Displays what happens next for people that do not need help with an employment tribunal fee
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I should see what happens next with 3 points

  Scenario: Save or print this page
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I should see save or print this page

  Scenario: Finish application
    Given I do not need help with an employment tribunal
    And I go to step twenty without skipping step nineteen
    When I click the finish application button
    Then I am taken to the thank you page
