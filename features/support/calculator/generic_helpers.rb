# rubocop:disable Style/TrivialAccessors
def user=(user)
  @user = user
end

def user
  @user
end
# rubocop:enable Style/TrivialAccessors

def calculator_start_page
  @calculator_start_page ||= ::AppTest::En::Calculator::StartPage.new
end

def calculator_marital_status_page
  @calculator_marital_status_page ||= ::AppTest::En::Calculator::MaritalStatusPage.new
end

def calculator_court_fee_page
  @calculator_court_fee_page ||= ::AppTest::En::Calculator::CourtFeePage.new
end

def calculator_date_of_birth_page
  @calculator_date_of_birth_page ||= ::AppTest::En::Calculator::DateOfBirthPage.new
end

def calculator_total_savings_page
  @calculator_total_savings_page ||= ::AppTest::En::Calculator::TotalSavingsPage.new
end

