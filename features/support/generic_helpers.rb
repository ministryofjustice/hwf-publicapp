def form_name_page
  @form_name_page ||= FormNamePage.new
end

def fee_page
  @fee_page ||= FeePage.new
end

def marital_status_page
  @marital_status_page ||= MaritalStatusPage.new
end

def savings_investment_page
  @savings_investment_page ||= SavingsInvestmentPage.new
end

def savings_investment_extra_page
  @savings_investment_extra_page ||= SavingsInvestmentExtraPage.new
end

def benefit_page
  @benefit_page ||= BenefitPage.new
end

def dependent_page
  @dependent_page ||= DependentPage.new
end

def income_kind_page
  @income_kind_page ||= IncomeKindPage.new
end

def income_range_page
  @income_range_page ||= IncomeRangePage.new
end

def income_amount_page
  @income_amount_page ||= IncomeAmountPage.new
end

def probate_page
  @probate_page ||= ProbatePage.new
end

def claim_page
  @claim_page ||= ClaimPage.new
end

def national_insurance_page
  @national_insurance_page ||= NationalInsurancePage.new
end

def dob_page
  @dob_page ||= DobPage.new
end

def personal_details_page
  @personal_details_page ||= PersonalDetailsPage.new
end

def address_page
  @address_page ||= AddressPage.new
end

def contact_page
  @contact_page ||= ContactPage.new
end

def summary_page
  @summary_page ||= SummaryPage.new
end

def confirmation_page
  @confirmation_page ||= ConfirmationPage.new
end

def confirmation_done_page
  @confirmation_done_page ||= ConfirmationDonePage.new
end

def base_page
  @base_page ||= BasePage.new
end

def common_page
  @common_page ||= CommonPage.new
end

def saucelabs_page
  @saucelabs_page ||= SaucelabsPage.new
end

def continue
  common_page.content.continue_button.click
end
