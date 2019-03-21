@saucelabs @hwf_submit_application

Feature: Saucelabs cross browser and device tests

  Scenario: Complete application on multiple browsers and devices
    Given I have started my application
    Then I should see the content for step one
    And I should see the content for step two
    And I should see the content for step three
    And I should see the content for step four
    And I should see the content for step five
    And I should see the content for step six
    And I should see the content for step seven
    And I should see the content for step eight
    And I should see the content for step nine
    And I should see the content for step ten
    And I should see the content for step eleven
    And I should see the content for step twelve
    And I should see the content for step thirteen
    And I should see the content for step fourteen
    And I should see the content for step fifteen
    And I should see the content for step sixteen
    And I should see the content for step seventeen
    And I should see the content for step eighteen
    And I should see the content for step nineteen
    And I should see the content for step twenty

  Scenario: Error message is displayed on multiple browsers and devices
    Given I have started my application
    When I click continue
    Then I should see 'Enter the form name or number, or select 'I don’t know the form name or number' error message

  Scenario: Help with is displayed on multiple browsers and devices
    Given I have started my application
    When I click on 'Applying for help with hearing fees'
    Then I see more information about the form name or number