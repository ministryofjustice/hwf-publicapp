@e2e

Feature: Claim page

  Background: Navigating to the claim page
    Given I visit the page for step twelve - Do you have a case, claim or ‘notice to pay’ number?
 
  Scenario: Selecting no to do you have a case, claim or notice to pay number
    When I select no to do you have a case, claim or notice to pay number
    Then I am taken to step 13 - What is your National Insurance number?

  Scenario: Entering a case, claim or notice to pay number
    When I select yes to do you have a case, claim or notice to pay number
    And I enter a case, claim or notice to pay number
    Then I am taken to step 13 - What is your National Insurance number?

  Scenario: Help with case numbers
    When I click on 'Help with case number'
    Then I should see help with case number copy

  Scenario: Displays enter a number error message
    And I select yes to do you have a case, claim or notice to pay number
    When I click continue
    Then I should see enter a case, claim or ‘notice to pay’ number error message

  Scenario: Displays make a selection error message
    When I click continue
    Then I should see select whether you have a case, claim or ‘notice to pay’ error message
