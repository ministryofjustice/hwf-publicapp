@hwf_submit_application @e2e

Feature: Summary page

  Scenario: Displays your details table - probate enabled
    Given I am on the summary page with probate enabled
    Then I should see probate in the check details table
    
  Scenario: Displays your details table - probate disabled
    Given I am on the summary page with probate disabled
    Then I should see my details:
    | scope                     |
    | Form name or number       |
    | Fee paid                  |
    | Status                    |
    | Savings and investments   |
    | Benefits                  |
    | Claim number              |
    | National Insurance number |
    | Date of birth             |
    | Full name                 |
    | Address                   |
    | Email                     |
    And I should be able to go back and change my details:
    | url                    |
    | form_name              |
    | fee                    |
    | marital_status         |
    | savings_and_investment |
    | benefit                |
    | claim                  |
    | national_insurance     |
    | dob                    |
    | personal_detail        |
    | applicant_address      |
    | contact                |
    And I should not see probate in the check details table

  Scenario: Displays declaration of truth
    Given I am on the summary page with probate enabled
    Then I should see declaration of truth

  Scenario: Continue button
    Given I am on the summary page with probate enabled
    When I click submit application and continue
    Then I should be taken to confirmation page
