@e2e

Feature: Form name page

  Background: Navigating to the form name page
    Given I am on the page for step one - What number is on your court or tribunal form?

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
      When I submit the form with I don’t have a form checked
      Then I should be taken to step two - Have you already paid the fee?

    Scenario: Applying for help with hearing fees
      When I click on 'Applying for help with hearing fees'
      Then I should see more information about what to put in the form number field

    Scenario: Displays please note timeout
      Then I should see the please note timeout
