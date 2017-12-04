# rubocop:disable Style/TrivialAccessors
def user=(user)
  @user = user
end

def user
  @user
end
# rubocop:enable Style/TrivialAccessors

def calculator_start_page
  @calculator_start_page ||= ::Calculator::StartPage.new
end

def calculator_marital_status_page
  @calculator_marital_status_page ||= ::Calculator::MaritalStatusPage.new
end

