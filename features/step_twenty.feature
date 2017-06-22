@step54
Feature: Step twenty page

  Scenario: Displays step number
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I see step 20 of 20
  
  Scenario: Displays header for people that do not need help with an employment tribunal fee
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I should see header 'Send your C100 form with your HWF-000-000 reference'

  Scenario: Displays header for people that need help with an employment tribunal fee
    Given I need help with an employment tribunal
    When I go to step twenty by skipping step nineteen
    Then I should see 'Your application for help with fees is not finished yet' header

  Scenario: Displays deliver your paperwork copy
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I should see deliver your paperwork copy

  Scenario: Displays what happens next for people that do not need help with an employment tribunal fee
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I should see what happens next with 3 points

  Scenario: Displays what happens next for people that need help with an employment tribunal fee
    Given I need help with an employment tribunal
    When I go to step twenty by skipping step nineteen
    Then I should see what happens next with 2 points

  Scenario: Displays point 1 for people that need help with an employment tribunal fee
    Given I need help with an employment tribunal
    When I go to step twenty by skipping step nineteen
    Then I should see point 1 with HWF number

  Scenario: Displays point 2 for people that need help with an employment tribunal fee
    Given I need help with an employment tribunal
    When I go to step twenty by skipping step nineteen
    Then I should see point 2 with letter

  Scenario: Displays point 3 for people that need help with an employment tribunal fee
    Given I need help with an employment tribunal
    When I go to step twenty by skipping step nineteen
    Then I should see point 3 with addresses

  Scenario: Save or print this page
    Given I do not need help with an employment tribunal
    When I go to step twenty without skipping step nineteen
    Then I should see save or print this page

  Scenario: Finish application
    Given I do not need help with an employment tribunal
    And I go to step twenty without skipping step nineteen
    When I click the finish application button
    Then I am taken to the thank you page
