require 'rails_helper'

RSpec.feature 'User can restart application' do

  scenario 'User decides to abandon application while filling up questions' do
    given_user_fills_in_few_questions
    when_they_restart_the_application
    then_their_data_is_deleted
  end

  scenario 'User decides to abandon application on the summary page' do
    given_user_provides_all_data
    when_they_restart_the_application
    then_their_data_is_deleted
  end

end
