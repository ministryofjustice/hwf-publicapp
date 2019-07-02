@e2e

Feature: Checklist page

  Background: Navigating to the checklist page
    Given probate is enabled
    And I am on the checklist page
 
  Scenario: National insurance number
    Then I see that I need to make sure that I have my national insurance number
    And if I do not have my national insurance number I can use the paper form
    
  Scenario: If you do not know your national insurance number
    When I click on if you do not know your national insurance number
    Then I should see where I can find the number
    And a link to receive a reminder in the post

  Scenario: Court and tribunal form number
    Then I see that I need to make sure that I have the court or tribunal form number

  Scenario: Case number, claim number or notice to pay
    Then I see that I need to make sure that I have the case number, claim number or notice to pay

  Scenario: Continue
    When I continue
    Then I should be taken to form number page
