Feature: Step four page

  Background: Navigating to the page for step four
    Given I visit the page for step four

  Scenario: Displays step number
    Then I should see step '4' of 20

  Scenario: Displays header
    Then I should see the step four header

  Scenario: Selecting £0 to £2,999
    When I select £0 to £2,999
    Then I am taken to step six

  Scenario: Selecting £3,000 to £15,999
    When I select £3,000 to £15,999
    Then I am taken to step five

  Scenario: Selecting £16,000 or more
    When I select £16,000 or more
    Then I am taken to step six

  Scenario: Help with savings and investments
    When I click on help with savings and investments
    Then I should see help with savings and investments copy  
 