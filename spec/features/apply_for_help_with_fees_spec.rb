# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  scenario 'I want to start the application for "Help with fees"' do
    start_the_application
  end

  scenario 'I want to add my marital status' do
    enter_marital_status
  end

  scenario 'I want to add information on my savings and investments' do
    enter_savings_and_investments
  end

  scenario 'I want to see the summary of my application' do
    application_summary
  end

  def start_the_application
    visit '/'
    click_link 'Apply now'
  end

  def enter_marital_status
    start_the_application
    expect(page).to have_content "What's your status?"
    choose 'marital_status_married_false'
    click_button 'Continue'
  end

  def enter_savings_and_investments
    start_the_application
    enter_marital_status
    expect(page).to have_content 'How much do you have in savings and investments?'
    choose 'savings_and_investment_less_than_limit_false'
    click_button 'Continue'
  end

  def enter_benefits_info
    start_the_application
    enter_marital_status
    enter_savings_and_investments
    expect(page).to have_content 'Do you receive any of the following benefits?'
    choose 'benefit_on_benefits_false'
    click_button 'Continue'
  end

  def application_summary
    start_the_application
    enter_marital_status
    enter_savings_and_investments
    enter_benefits_info
    expect(page).to have_content 'Check details'
    expect(page).to have_content 'Single'
    expect(page).to have_content 'Less than £3,000'
    expect(page).to have_content 'Not receiving eligible benefits'
  end
end
