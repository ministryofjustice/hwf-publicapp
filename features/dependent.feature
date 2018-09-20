@e2e

Feature: Dependent page

  Background: Dependent page
    Given I am on the page for step seven - Do you have any children living with you, or who you support financially?

  Scenario: Yes to do you have any children
    When I select yes to do you have any children
    And I submit the form with '4' children
    Then I am taken to step 8 - What kind of income do you receive?

  Scenario: No to do you have any children
    When I submit the form with no I do not have any children
    Then I am taken to step 8 - What kind of income do you receive?

  Scenario: Displays error message
    When I click continue
    Then I should see you need to say whether you have financially dependent children error message

  Scenario: Help with benefits
    When I click on 'Help with financially dependent children'
    Then I should see help with financially dependent children copy
