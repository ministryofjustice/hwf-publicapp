@zap @hwf_submit_application

Feature: Run an OWASP ZAP screening
  As a user
  I want to run a security screening for my site
  In order to have a secure application

  Background: Run OWASP Zap
    Given I launch owasp zap for a scan

  Scenario: Finish application with Zap security
    When I take the happy path through steps 1 to 20
    Then I should be able to see security warnings

