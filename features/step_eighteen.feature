Feature: Step eighteen page

  Background: Navigating to the page for step eighteen
    Given I visit the page for step eighteen

  Scenario: Displays step number
    Then I should see 'Step 18 of 20'
  
  Scenario: Displays header
    Then I should see 'Check details' header

  Scenario: Displays check your details are correct copy
    Then I should see check your details are correct copy

  Scenario: Displays your details table
    Then I should see my details:
    | scope                     |
    | Form name or number       |
    | Fee paid                  |
    | Status                    |
    | Savings and investments   |
    | Benefits                  |
    | Children                  |
    | Income                    |
    | Probate case              |
    | Claim number              |
    | National Insurance number |
    | Date of birth             |
    | Full name                 |
    | Address                   |
    | Contact                   |
    And I should be able to go back and change my details:
    | url                    |
    | form_name              |
    | fee                    |
    | marital_status         |
    | savings_and_investment |
    | benefit                |
    | dependent              |
    | income_kind            |
    | probate                |
    | claim                  |
    | national_insurance     |
    | dob                    |
    | personal_detail        |
    | applicant_address      |
    | contact                |

  Scenario: Displays declaration of truth
    Then I should see declaration of truth

  @step54
  Scenario: Continue button
    When I click submit application and continue
    Then I taken to step 19 of 20 confirmation