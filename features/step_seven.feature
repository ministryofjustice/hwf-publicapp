Feature: Step seven page

  Background: Navigating to the page for step seven
    Given I visit the page for step seven

  Scenario: Displays step number
    Then I should see step 7 of 20
  
  Scenario: Displays header
    Then I should see 'Do you have any children living with you' header

  Scenario: Yes to do you have any children
    When I select yes to do you have any children
    And I add I have '4' children
    Then I am taken to step 8 income_kind

  Scenario: No to do you have any children
    When I select no to do you have any children
    Then I am taken to step 8 income_kind

  Scenario: Displays error message
    When I click continue
    Then I should see 'financially dependent children' error message

  Scenario: Help with benefits
    When I open 'Help with financially dependent children'
    Then I should see help with financially dependent children copy
