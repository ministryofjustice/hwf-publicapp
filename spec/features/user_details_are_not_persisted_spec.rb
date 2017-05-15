# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'User details are not persisted' do

  scenario 'User completes the application and their data is cleared out of the session' do
    given_user_provides_all_data
    and_the_submission_service_is_available
    when_they_submit_the_application
    then_their_data_is_not_persisted
  end
end
