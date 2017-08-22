@saucelabs @hwf_submit_application

Feature: Saucelabs cross browser and device tests

  Scenario: Finish application
    Given I do not need help with an employment tribunal
    And I have no children
    And I have no income
    When I submit my application
    Then I am taken to the thank you page