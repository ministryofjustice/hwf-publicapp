Feature: Step fifteen page

  Background: Navigating to the page for step fifteen
    Given I visit the page for step fifteen

  Scenario: Displays step number
    Then I should see step '15' of 20
  
  Scenario: Displays header
    Then I should see 'What is your full name?' header

  Scenario: Entering valid personal details
    When I enter a valid title
    And I enter a valid first name
    And I enter a valid last name
    Then I am taken to step sixteen

  Scenario: Entering a full name without a title
    When I enter a valid first name
    And I enter a valid last name
    Then I am taken to step sixteen

  Scenario: Displays enter your first name error message
    When I enter a valid last name
    And I click continue
    Then I should see 'Enter your first name' error message

  Scenario: Displays enter your last name error message
    When I enter a valid first name
    And I click continue
    Then I should see 'Enter your last name' error message

