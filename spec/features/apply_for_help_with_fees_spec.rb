require 'rails_helper'

RSpec.feature 'As a user' do
  scenario 'I want to start the application for "Help with fees"' do
    visit '/'
    click_link 'Apply now'
    expect(page).to have_content "What's your status?"
    choose 'marital_status_married_false'
    click_button 'Continue'
    expect(page).to have_content 'Check details'
  end
end
