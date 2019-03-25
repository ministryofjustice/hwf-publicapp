@e2e

Feature: Form name page

    Scenario: Does not display probate applications not available warning message - probate enabled
      Given probate is enabled
      When I am on the page for step one - What court or tribunal fee do you need help with?
      Then I should not see probate applications not available warning message

    Scenario: Displays probate applications not available warning message - probate disabled
      Given probate is disabled
      When I am on the page for step one - What court or tribunal fee do you need help with?
      Then I should see probate applications not available warning message

    Scenario: Entering valid form number
      Given I am on the page for step one - What court or tribunal fee do you need help with?
      When I submit the form with a valid form number
      Then I should be taken to step two - Have you already paid the fee?

    Scenario: Entering a valid form name
      Given I am on the page for step one - What court or tribunal fee do you need help with?
      When I submit the form with a valid form name
      Then I should be taken to step two - Have you already paid the fee?

    Scenario: Leaving form name or number blank
      Given I am on the page for step one - What court or tribunal fee do you need help with?
      When I submit the form without a form name or number
      Then I should see enter the form name or number error message

    Scenario: Selecting I don’t know the form name or number
      Given I am on the page for step one - What court or tribunal fee do you need help with?
      When I submit the form with I don’t know the form name or number checked
      Then I should be taken to step two - Have you already paid the fee?

    Scenario: Help with form name or number
      Given I am on the page for step one - What court or tribunal fee do you need help with?
      When I click on 'Help with form name or number'
      Then I see more information about the form name or number

    Scenario: Displays please note timeout
      Given I am on the page for step one - What court or tribunal fee do you need help with?
      Then I should see the please note timeout
