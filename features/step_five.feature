@e2e

Feature: Step five page

  Scenario: Displays step number
    Given I am on the page for step five
    Then I should see step 5 of 20
  
  Scenario: Displays single person header
    Given I am a single person
    When I am on the page for step five with £3,000 to £15,999 in savings
    Then I should see 'Are you 61 years old or over?' header

  Scenario: Displays married person header
    Given I am a married person
    When I am on the page for step five with £3,000 to £15,999 in savings
    Then I should see 'Are you or your partner 61 years old or over?' header

  Scenario: Selecting yes to are you 61 years old or over?
    Given I am on the page for step five
    When I select yes to are you 61 years old or over?
    And I click continue
    Then I am taken to step 6 - Do you receive any of the following benefits?

  Scenario: Single and not 61 years old or over
    Given I am a single person
    When I am on the page for step five with £3,000 to £15,999 in savings
    And I select no to are you 61 years old or over?
    Then I should be asked 'How much between £3,000 and £15,999 do you have'

  Scenario: Married and not 61 years old or over
    Given I am a married person
    When I am on the page for step five with £3,000 to £15,999 in savings
    And I select no to are you 61 years old or over?
    Then I should be asked 'How much between £3,000 and £15,999 do you and your partner have'

  Scenario: Entering a valid amount within range
    Given I am a single person
    When I am on the page for step five with £3,000 to £15,999 in savings
    And I select no to are you 61 years old or over?
    And I enter '5000' into the input field
    And I click continue
    Then I am taken to step 6 - Do you receive any of the following benefits?

  Scenario: Displays out of the range error message
    Given I am a single person
    When I am on the page for step five with £3,000 to £15,999 in savings
    And I select no to are you 61 years old or over?
    And I enter '16000' into the input field
    And I click continue
    Then I should see 'or go back to the previous question' error message

  Scenario: Displays how much error message when left blank
   Given I am a single person
    When I am on the page for step five with £3,000 to £15,999 in savings
    And I select no to are you 61 years old or over?
    And I click continue
    Then I should see 'Enter how much you have in savings and investments' error message
    