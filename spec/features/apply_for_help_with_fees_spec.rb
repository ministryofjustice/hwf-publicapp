# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  scenario 'I want to start the application for "Help with fees"' do
    page.visit '/'
    page.click_link 'Apply now'
  end

  scenario 'I want to add my marital status' do
    page.visit '/'
    page.click_link 'Apply now'
    expect(page).to have_content "What's your status?"
    choose 'marital_status_married_false'
    click_button 'Continue'
  end

  scenario 'I want to add information on my savings and investments' do
    page.visit '/'
    page.click_link 'Apply now'
    expect(page).to have_content "What's your status?"
    choose 'marital_status_married_false'
    click_button 'Continue'
    expect(page).to have_content 'How much do you have in savings and investments?'
    choose 'savings_and_investment_less_than_limit_false'
    click_button 'Continue'
  end

  scenario 'I want to add information on benefits' do
    page.visit '/'
    page.click_link 'Apply now'
    expect(page).to have_content "What's your status?"
    choose 'marital_status_married_false'
    click_button 'Continue'
    expect(page).to have_content 'How much do you have in savings and investments?'
    choose 'savings_and_investment_less_than_limit_false'
    click_button 'Continue'
    expect(page).to have_content 'Do you receive any of the following benefits?'
    choose 'benefit_on_benefits_false'
    click_button 'Continue'
  end

  scenario 'I want to add information on fee payment' do
    page.visit '/'
    page.click_link 'Apply now'
    expect(page).to have_content "What's your status?"
    choose 'marital_status_married_false'
    click_button 'Continue'
    expect(page).to have_content 'How much do you have in savings and investments?'
    choose 'savings_and_investment_less_than_limit_false'
    click_button 'Continue'
    expect(page).to have_content 'Do you receive any of the following benefits?'
    choose 'benefit_on_benefits_false'
    click_button 'Continue'
    expect(page).to have_content 'Have you already paid the fee?'
    choose 'fee_paid_false'
    click_button 'Continue'
  end

  scenario 'I want to see the summary of my application' do
    page.visit '/'
    page.click_link 'Apply now'
    expect(page).to have_content "What's your status?"
    choose 'marital_status_married_false'
    click_button 'Continue'
    expect(page).to have_content 'How much do you have in savings and investments?'
    choose 'savings_and_investment_less_than_limit_false'
    click_button 'Continue'
    expect(page).to have_content 'Do you receive any of the following benefits?'
    choose 'benefit_on_benefits_false'
    click_button 'Continue'
    expect(page).to have_content 'Have you already paid the fee?'
    choose 'fee_paid_false'
    click_button 'Continue'
    expect(page).to have_content 'Check details'
    expect(page).to have_content 'Single'
    expect(page).to have_content 'Less than £3,000'
    expect(page).to have_content 'Not receiving eligible benefits'
    expect(page).to have_content 'Fee paidNo'
  end
end
