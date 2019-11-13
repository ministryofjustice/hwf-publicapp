require Rails.root.join('spec', 'support', 'probate_fees_switchover_helper.rb')

def probate_disabled
  travel_to probate_fees_release_date + 1.day
  puts 'probate is disabled: ' + ProbateFeesSwitch.disable_probate_fees?.to_s
end

def probate_enabled
  travel_to a_day_before_disable_probate_fees
  puts 'probate is disabled: ' + ProbateFeesSwitch.disable_probate_fees?.to_s
end

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

def checklist_page
  @checklist_page ||= ChecklistPage.new
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

def saucelabs_page
  @saucelabs_page ||= SaucelabsPage.new
end

def checklist_continue
  base_page.content.checklist_continue_button.click
end

def continue
  base_page.content.continue_button.click
end
