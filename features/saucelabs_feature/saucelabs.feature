@saucelabs @hwf_submit_application

Feature: Saucelabs cross browser and device tests

  Scenario: Finish application
    Given I do not need help with an employment tribunal
    And I go to step twenty without skipping step nineteen
    When I click the finish application button
    Then I am taken to the thank you page