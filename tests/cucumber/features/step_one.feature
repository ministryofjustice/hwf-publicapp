Feature: Step one page

  Background: Navigating to the page for step one
    Given I visit the page for step one

    Scenario: Displays step number
      Then I should see step number

    Scenario: Displays header
      Then I should see the step one header

    Scenario: Displays hint
      Then I should see step one hint

    Scenario: Displays label
      Then I should see step one label

    Scenario: Entering valid form number
      When I enter a valid form number
      Then I am taken to step two

    Scenario: Entering a valid form name
      When I enter a valid form name
      Then I am taken to step two

    Scenario: Leaving form name or number blank
      When I leave the form name or number blank
      Then I see error message telling me I need to fix the errors

    Scenario: Selecting I don’t know the form name or number
      When I select I don’t know the form name or number
      Then I am taken to step two

    Scenario: Selecting I need help with an employment tribunal fee
      When I select I need help with an employment tribunal fee
      Then I am taken to step two

    Scenario: Help with form name or number
      When I open help with form name or number
      Then I see more information about the form name or number

    Scenario: Please note is displayed
      Then I should see the please note copy

    Scenario: Cancel application
      And I click on cancel application
      And I see the are you sure copy
      When I click on yes, cancel
      Then I am taken to the Help with Fees homepage

    Scenario: Return to current application
      And I click on cancel application
      When I click on no, return to current application
      Then I should not see the cancel application options
      And I should remain on the page for step one

