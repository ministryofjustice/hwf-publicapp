Feature: Step seventeen page

  Background: Navigating to the page for step seventeen
    Given I visit the page for step seventeen

  Scenario: Displays step number
    Then I should see step '17' of 20
  
  Scenario: Displays header
    Then I should see 'What's your email address?' header

  Scenario: Displays confirmation copy
    Then I should see confirmation copy

  Scenario: Entering a valid email address
    When I enter a valid email address
    Then I should be taken to step 18 summary

  Scenario: Entering a invalid email address
    When I enter a invalid email address
    And I click continue
    Then I remain on step 17

  Scenario: Displays share your experience
    Then I should see share your experience checkbox

  Scenario: Continuing without supplying an email address
    When I click continue
    Then I am taken to step 18 summary