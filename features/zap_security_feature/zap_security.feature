@zap @hwf_submit_application

Feature: Run an OWASP ZAP screening

  Scenario: Happy path through HWF application
    Given I have started my application
    When I take the happy path through steps 1 to 20
    Then I am taken to the thank you page
