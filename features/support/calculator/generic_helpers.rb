# rubocop:disable Style/TrivialAccessors
def user=(user)
  @user = user
end

def user
  @user
end
# rubocop:enable Style/TrivialAccessors

def calculator_start_page
  @calculator_start_page ||= ::MojHwf::Calculator::Test::En::StartPage.new
end

def calculator_marital_status_page
  @calculator_marital_status_page ||= ::MojHwf::Calculator::Test::En::MaritalStatusPage.new
end

def calculator_court_fee_page
  @calculator_court_fee_page ||= ::MojHwf::Calculator::Test::En::CourtFeePage.new
end

def calculator_date_of_birth_page
  @calculator_date_of_birth_page ||= ::MojHwf::Calculator::Test::En::DateOfBirthPage.new
end

def calculator_total_savings_page
  @calculator_total_savings_page ||= ::MojHwf::Calculator::Test::En::TotalSavingsPage.new
end

def any_calculator_page
  @any_calculator_page ||= ::MojHwf::Calculator::Test::En::BasePage.new
end
