Feature: Step five page

  Scenario: Displays step number
    Given I am a single person with £3,000 to £15,999 savings
    Then I should see step '5' of 20
  
  Scenario: Displays single header
    Given I am a single person with £3,000 to £15,999 savings
    Then I should see 'Are you 61 years old or over?' header

  Scenario: Displays married header
    Given I am a married person with £3,000 to £15,999 savings
    Then I should see 'Are you or your partner 61 years old or over?' header

  Scenario: Selecting yes to are you 61 years old or over?
    Given I am a single person with £3,000 to £15,999 savings
    When I select yes to are you 61 years old or over?
    Then I am taken to step six

  Scenario: Single and not 61 years old or over
    Given I am a single person with £3,000 to £15,999 savings
    When I select no to are you 61 years old or over?
    Then I should be asked 'do you have'

  Scenario: Married and not 61 years old or over
    Given I am a married person with £3,000 to £15,999 savings
    When I select no to are you 61 years old or over?
    Then I should be asked 'do you and your partner have'

  Scenario: Entering a valid amount within range
    Given I am a single person with £3,000 to £15,999 savings
    And I select no to are you 61 years old or over?
    When I enter '5000' into the input field
    Then I am taken to step six

  Scenario: Displays out of the range error message
    Given I am a single person with £3,000 to £15,999 savings
    And I select no to are you 61 years old or over?
    When I enter '16000' into the input field
    Then I should see 'or go back to the previous question' error message

  Scenario: Displays how much error message when left blank
    Given I am a single person with £3,000 to £15,999 savings
    And I select no to are you 61 years old or over?
    When I click continue
    Then I should see 'Enter how much you have in savings and investments' error message