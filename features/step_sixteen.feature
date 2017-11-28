@e2e

Feature: Step sixteen page

  Background: Navigating to the page for step sixteen
    Given I visit the page for step sixteen

  Scenario: Displays step number
    Then I should see step 16 of 20
  
  Scenario: Displays header
    Then I should see 'What is your address?' header

  Scenario: Entering address with postcode
    When I enter my address with postcode
    Then I am taken to step 17 - What's your email address?

  Scenario: Displays enter your postcode error message
    When I enter my address
    And I click continue
    Then I should see 'Enter your postcode' error message

  Scenario: Displays enter your address error message
    When I enter my postcode
    And I click continue
    Then I should see 'Enter your address' error message

  Scenario: Displays error message when no address is entered
    And I click continue
    Then I should see 'Enter your address' error message
    