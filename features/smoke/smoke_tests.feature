@hwf_submit_application @smoke @accessible_selenium

Feature: Smoke Tests

  Scenario: I do not need help with an employment tribunal
    Given I do not need help with an employment tribunal
    And I go to step twenty without skipping step nineteen
    When I click the finish application button
    Then I am taken to the thank you page

  Scenario: I need help with an employment tribunal
    Given I need help with an employment tribunal
    And I go to step twenty by skipping step nineteen
    When I click the finish application button
    Then I am taken to the thank you page