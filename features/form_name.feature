@e2e

Feature: Form number page

  Background: Navigating to the form number page
    Given I am on the page for step one - What number is on your court or tribunal form?

    Scenario: Displays probate applications not available warning message
      Then I should see probate applications not available warning message

    Scenario: Entering valid form number
      When I submit the form with a valid form number
      Then I should be taken to step two - Have you already paid the fee?

    Scenario: Leaving form number blank
      When I submit the form without a number
      Then I should see enter a number error message

    Scenario: Entering a help with fees form number
      When I submit the form with a help with fees form number 'COP44A'
      Then I should see you entered the help with fees form number error message
      And I submit the form with a help with fees form number 'EX160'
      Then I should see you entered the help with fees form number error message

    Scenario: Selecting I don’t have a form
      When I submit the form with I don’t have a form checked
      Then I should be taken to step two - Have you already paid the fee?

    Scenario: Applying for help with hearing fees
      When I click on 'Applying for help with hearing fees'
      Then I should see more information about what to put in the form number field

    Scenario: Displays please note timeout
      Then I should see the please note timeout
