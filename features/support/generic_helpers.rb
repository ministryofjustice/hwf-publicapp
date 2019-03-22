def wait_for
  Timeout.timeout(Capybara.default_max_wait_time) do
    loop until yield
  rescue StandardError # rubocop:disable Lint/HandleExceptions
    # ignored
  end
end

def wait_for_document_ready
  wait_for { page.evaluate_script('document.readyState').eql? 'complete' }
end

def scroll_to_bottom
  WaitUntil.wait_until(3, 'Failed as browser hasnt reached bottom of window') do
    page.execute_script 'window.scrollTo(0,$(document).height())'
    y_position = page.evaluate_script 'window.scrollY'
    browser_height = page.evaluate_script '$(window).height();'
    doc_height = page.evaluate_script '$(document).height();'
    (y_position + browser_height).eql?(doc_height)
  end
end

module WaitUntil
  def self.wait_until(timeout = 10, message = nil, &block)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout, message: message)
    wait.until(&block)
  end
end

def answer_up_to_fee_page
  step 'I am on the page for step one - What number is on your court or tribunal form?'
  step 'I submit the form with a valid form number'
end

def answer_up_to_marital_status_page
  answer_up_to_fee_page
  step 'I select no to have you already paid the fee?'
  step 'I click continue'
end

def answer_up_to_savings_and_investment_single
  answer_up_to_marital_status_page
  step 'I submit the form as single'
end

def answer_up_to_savings_and_investment_married
  answer_up_to_marital_status_page
  step 'I submit the form as married'
end

def answer_up_to_over_61_single
  answer_up_to_savings_and_investment_single
  step 'I submit the form with £3,000 to £15,999 checked'
end

def answer_up_to_over_61_married
  answer_up_to_savings_and_investment_married
  step 'I submit the form with £3,000 to £15,999 checked'
end

def answer_up_to_benefit_single
  answer_up_to_savings_and_investment_single
  step 'I submit the form with £0 to £2,999 checked'
end

def answer_up_to_benefit_married
  answer_up_to_savings_and_investment_married
  step 'I submit the form with £0 to £2,999 checked'
end

def answer_up_to_dependent_single
  answer_up_to_benefit_single
  step 'I submit the form with no I do not receive one of the benefits listed'
end

def answer_up_to_dependent_married
  answer_up_to_benefit_married
  step 'I submit the form with no I do not receive one of the benefits listed'
end

def answer_up_to_income_kind_single
  answer_up_to_dependent_single
  step 'I submit the form with no I do not have any children'
end

def single_with_three_children
  answer_up_to_dependent_single
  step 'I select yes to do you have any children'
  step 'I add I have three children'
end

def answer_up_to_income_kind_married
  answer_up_to_dependent_married
  step 'I submit the form with no I do not have any children'
end

def answer_up_to_income_range_single_no_children
  answer_up_to_income_kind_single
  step 'after selecting wages from income list on step eight'
  step 'after selecting working tax credit from income list on step eight'
  step 'I click continue'
end

def answer_up_to_income_range_married_no_children
  answer_up_to_income_kind_married
  step 'after selecting wages from income list on step eight'
  step 'I click continue'
end

def answer_up_to_income_range_married_with_children
  answer_up_to_income_kind_married
  step 'after selecting wages from income list on step eight'
  step 'I click continue'
end

def answer_up_to_income_range_single_with_children
  single_with_three_children
  step 'after selecting wages from income list on step eight'
  step 'I click continue'
end

def answer_up_to_income_amount_single
  answer_up_to_income_range_single_with_children
  step 'I select between'
end

def answer_up_to_income_amount_married
  answer_up_to_income_range_married_with_children
  step 'I select between'
end

def answer_up_to_claim_page
  answer_up_to_income_amount_single
  step 'I submit the form with my monthly income'
  step 'I select no to are you paying a fee for a probate case'
end

def answer_up_to_national_insurance_page
  answer_up_to_claim_page
  claim_page.content.no.click
  continue
end

def answer_up_to_dob
  answer_up_to_national_insurance_page
  step 'I enter a valid national insurance number'
end

def form_name_page
  @form_name_page ||= FormNamePage.new
end

def fee_page
  @fee_page ||= FeePage.new
end

def marital_status_page
  @marital_status_page ||= MaritalStatusPage.new
end

def savings_and_investment_page
  @savings_and_investment_page ||= SavingsAndInvestmentPage.new
end

def over_61_page
  @over_61_page ||= Over61Page.new
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
  @dob_page ||= DOBPage.new
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

def check_details_page
  @check_details_page ||= CheckDetailsPage.new
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
