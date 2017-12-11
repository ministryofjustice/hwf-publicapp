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

