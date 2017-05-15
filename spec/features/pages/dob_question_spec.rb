# coding: utf-8
# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "dob" page for "Help with fees"' do
    before { given_user_answers_questions_up_to(:dob) }

    context 'completing the form correctly' do
      before do
        fill_in :dob_date_of_birth, with: '01/01/1990'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "personal-detail" page' do
        expect(page).to have_content 'What is your full name?'
      end
    end

    context 'not completing the page correctly' do
      describe 'leaving all fields empty' do
        before { click_button 'Continue' }

        scenario 'I expect to be shown the "dob" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter the date in this format DD/MM/YYYY')
        end
      end

      describe 'by entering a date of birth that is too young' do
        before do
          fill_in :dob_date_of_birth, with: Time.zone.yesterday
          click_button 'Continue'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'You must be over 15 to use this service')
        end
      end

      describe 'by entering a date of birth that is too old' do
        before do
          fill_in :dob_date_of_birth, with: Time.zone.today - 125.years
          click_button 'Continue'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Check this date of birth is correct')
        end
      end

      describe 'by entering data that is not a date' do
        before do
          fill_in :dob_date_of_birth, with: 'foo'
          click_button 'Continue'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter the date in this format DD/MM/YYYY')
        end
      end
    end
  end
end
