@e2e
@integration
Feature: Disposable Capital
  HwF Calculator should be able to execute Disposable Capital Test to check eligibility.
  Eligibility criteria for Disposable Capital Test is specified and threshold defined for both fee exemption and fee remission in the legislation
  Rules:
  Citizen must enter their civil partnership status, court fee, age and disposable capital amount
  Disposable Capital must be for Citizen and their partners
  Response header 1:
  Negative decision: You are unlikely to get help with your fees
  Positive decision: You are likely to get help with fees
  Response header 2:
  Negative decision: With a fee of £XXX and savings of £XXX, it is unlikely that you'll be able to get financial help,  unless you are likely to experience exceptional hardship
  Positive decision: With a fee of £XXX and savings of £XXX you (and your partner)should be able to get help with your fees, as long as you receive certain benefits or are on a low income

  Background:
    Given I am a calculator user

  Scenario Outline: Under 61 year old test for disposable capital of less than £3,000 and fee band of up to £1,000
    Given I am <Age> years of age
    And my court or tribunal fee is <Court Fee>
    And savings and investment amount of <Capital>
    And civil partnership status is <Marital Status>
    And I navigate to the calculator savings and investment page
    And I fill in the calculator savings and investment page
    When I click on the Next step button on the calculator savings and investment page
    Then the calculator response should be "<Response header 1> <Response header 2>"
    And savings and investment question, answer appended to the calculator Previous answers section

    Examples:
      | Marital Status | Age | Court Fee | Capital | Response header 1                           | Response header 2                                                                                                                                                       |
      | Single         | 20  | 500       | 2999    | You are likely to get help with fees        | With a fee of £500 and savings of £2,999 you should be able to get help with your fees, as long as you receive certain benefits or are on a low income                  |
      | Single         | 60  | 1000      | 3000    | You are unlikely to get help with your fees | With a fee of £1000 and savings of £3,000 it is unlikely that you'll be able to get financial help,  unless you are likely to experience exceptional hardship           |
      | Married        | 39  | 600       | 2400    | You are likely to get help with fees        | With a fee of £600 and savings of £2,400 you and your partner should be able to get help with your fees, as long as you receive certain benefits or are on a low income |

  Scenario: DEVELOPMENT
    Given I am 60 years of age
    And my court or tribunal fee is 1000
    And savings and investment amount of 3000
    And civil partnership status is Single
    And I navigate to the calculator savings and investment page
    And I fill in the calculator savings and investment page
    When I click on the Next step button on the calculator savings and investment page
    Then the calculator response should be "You are unlikely to get help with your fees With a fee of £1000 and savings of £3,000 it is unlikely that you'll be able to get financial help,  unless you are likely to experience exceptional hardship"
    And savings and investment question, answer appended to the calculator Previous answers section