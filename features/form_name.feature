@e2e

Feature: Form name page

  Background: Navigating to the form name page
    Given I am on the form number page

    Scenario: Entering valid form number
      When I submit the form with a valid form number
      Then I should be taken to fee page

    Scenario: Entering a valid form name
      When I submit the form with a valid form name
      Then I should be taken to fee page

    Scenario: Leaving form name or number blank
      When I submit the form without a form name or number
      Then I should see enter the form name or number error message

    Scenario: Selecting I don’t know the form name or number
      When I submit the form with I don’t know the form name or number checked
      Then I should be taken to fee page

    Scenario: Help with form name or number
      When I click on 'Help with form name or number'
      Then I see more information about the form name or number

    Scenario: Displays please note timeout
      Then I should see the please note timeout
