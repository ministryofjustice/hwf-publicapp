@e2e

Feature: Step one page

  Background: Page one
    Given I am on the page for step one

    Scenario: Displays step number
      Then I should see step 1 of 20

    Scenario: Displays header
      Then I should see 'What court or tribunal fee do you need help with?' header

    Scenario: Displays hint
      Then I should see form hint 'Enter the court or tribunal form number'

    Scenario: Displays label
      Then I should see form label 'Form name or number'

    Scenario: Entering valid form number
      When I submit the form with a valid form number
      Then I am taken to step 2 fee

    Scenario: Entering a valid form name
      When I submit the form with a valid form name
      Then I am taken to step 2 fee

    Scenario: Leaving form name or number blank
      When I try to submit the form with the form name or number left blank
      Then I should see 'Enter the form name or number' error message

    Scenario: Selecting I don’t know the form name or number
      When I submit the form with I don’t know the form name or number checked
      Then I am taken to step 2 fee

    Scenario: Help with form name or number
      When I click on 'Help with form name or number'
      Then I see more information about the form name or number

    Scenario: Please note is displayed
      Then I should see the please note copy
