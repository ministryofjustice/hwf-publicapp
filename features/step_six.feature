Feature: Step six page

  Background: Navigating to the page for step six
    Given I visit the page for step six

  Scenario: Displays step number
    Then I should see step '6' of 20
  
  Scenario: Displays header
    Then I should see 'Do you receive any of the following benefits?' header

  Scenario: Displays benefits list
    Then I should see the benefits list

  Scenario: No I am not receiving any benefits from list
    When I select no to do you receive any of the following benefits?
    Then I am taken to step seven

  Scenario: Yes I am receiving benefits from list
    When I select yes to do you receive any of the following benefits?
    Then I am taken to step eleven

  Scenario: Displays error message
    When I click continue
    Then I should see 'Select whether you're receiving one of the benefits listed' error message

  Scenario: Help with benefits
    When I click on help with 'benefits'
    Then I should see help with benefits copy
