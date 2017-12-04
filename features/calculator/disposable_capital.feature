@e2e
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
    Given I am <age> years of age
    And my court or tribunal fee is <Court Fee>
    And savings and investment amount of <capital>
    And civil partnership status is <Marital status>
    And I navigate to the calculator savings and investment page
    When I click on the Next step button on the savings and investment page
    Then response should be <response header 1> <response header 2> displayed at the top of the page above the benefit question
    And savings and investment question, answer appended to the Previous answers section

    Examples:
      | Marital Status | Age | Court Fee | Capital | Response header 1                    | Response header 2                                                                                                                                                       |
      | Single         | 60  | 100       | 3000    | You are likely to get help with fees | With a fee of £100 and savings of £3,000 you should be able to get help with your fees, as long as you receive certain benefits or are on a low income                  |
      | Married        | 39  | 600       | 2400    | You are likely to get help with fees | With a fee of £600 and savings of £2,400 you and your partner should be able to get help with your fees, as long as you receive certain benefits or are on a low income |

    Scenario: DEVELOPMENT
      Given I am 20 years of age
      And my court or tribunal fee is 500
      And savings and investment amount of 2999
      And civil partnership status is Married
      And I navigate to the calculator savings and investment page
      And I debug