@e2e

Feature: Form name page

  Background: Form name page
    Given I am on the page for step one - What court or tribunal fee do you need help with?

    Scenario: Entering valid form number
      When I submit the form with a valid form number
      Then I should be taken to step two - Have you already paid the fee?

    Scenario: Entering a valid form name
      When I submit the form with a valid form name
      Then I should be taken to step two - Have you already paid the fee?

    Scenario: Leaving form name or number blank
      When I submit the form without a form name or number
      Then I should see enter the form name or number error message

    Scenario: Selecting I don’t know the form name or number
      When I submit the form with I don’t know the form name or number checked
      Then I should be taken to step two - Have you already paid the fee?

    Scenario: Help with form name or number
      When I click on 'Help with form name or number'
      Then I see more information about the form name or number

    Scenario: Displays please note timeout
      Then I should see the please note timeout
