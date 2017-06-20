Feature: Step nineteen page

  Background: Navigating to the page for step nineteen
    Given I visit the page for step nineteen

  Scenario: Displays step number
    Then I see step 19 of 20
  
  Scenario: Displays header
    Then I should see header 'Your application for help with fees is not finished yet'

  Scenario: Displays directions
    Then I should see directions

  Scenario: Save or print this page
    Then I should see save or print this page

  Scenario: Continue to step twenty
    When I press the continue button
    Then I go to step twenty
