Feature: Step twelve page

  Scenario: Displays step number
    Given I do not need help with an employment tribunal
    When I go to step twelve without skipping step eleven
    Then I should see step '12' of 20
  
  Scenario: Displays header for people that do not need help with an employment tribunal fee
    Given I do not need help with an employment tribunal
    When I go to step twelve without skipping step eleven
    Then I should see 'Do you have a case, claim or ‘notice to pay' header

  Scenario: Displays header for people that do need help with an employment tribunal fee
    Given I need help with an employment tribunal
    When I go to step twelve by skipping step eleven
    Then I should see 'Enter your employment tribunal claim number' header

  Scenario: Hint for people that do not need help with an employment tribunal fee
    Given I do not need help with an employment tribunal
    When I go to step twelve without skipping step eleven
    Then I should see hint 'Find this number on letters from the court or tribunal.'

  Scenario: Hint for people that do need help with an employment tribunal fee
    Given I need help with an employment tribunal
    When I go to step twelve by skipping step eleven
    Then I should see hint 'digital submission or letters from the court or tribunal.'

  Scenario: Selecting no to do you have a case, claim or notice to pay number
    Given I do not need help with an employment tribunal
    And I go to step twelve without skipping step eleven
    When I select no to do you have a case, claim or notice to pay number
    Then I am taken to step thirteen

  Scenario: Entering a employment tribunal number
    Given I need help with an employment tribunal
    And I go to step twelve by skipping step eleven
    When I enter a employment tribunal number
    Then I am taken to step thirteen

  Scenario: Entering a case, claim or notice to pay number
    Given I visit the page for step twelve
    When I select yes to do you have a case, claim or notice to pay number
    And I enter a case, claim or notice to pay number
    Then I am taken to step thirteen

  Scenario: Help with employment tribunal number
    Given I need help with an employment tribunal
    And I go to step twelve by skipping step eleven
    When I click on help with 'employment tribunal claim number'
    Then I should see help with employment tribunal claim number copy

  Scenario: Help with case number
    Given I do not need help with an employment tribunal
    And I go to step twelve without skipping step eleven
    When I open 'Help with case number'
    Then I should see help with case number copy

  Scenario: Displays enter a number error message
    Given I visit the page for step twelve
    And I select yes to do you have a case, claim or notice to pay number
    When I click continue
    Then I should see 'Enter a case, claim or ‘notice to pay’ number' error message

  Scenario: Displays make a selection error message
    Given I visit the page for step twelve
    When I click continue
    Then I should see 'Select whether you have a case, claim or ‘notice to pay’' error message