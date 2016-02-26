# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "national-insurance" page for "Help with fees"' do
    before { page.visit 'national-insurance' }

    context 'completing the form correctly' do
      before do
        fill_in :number, with: 'AB123456A'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "dob" page' do
        expect(page).to have_content 'What is your date of birth?'
      end
    end

    context 'not completing the page correctly' do
      describe 'leaving the field empty' do
        before do
          click_button 'Continue'
        end

        scenario 'I expect to be shown the "national-insurance" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter your National Insurance number')
        end
      end

      describe 'providing an incorrect value' do
        before do
          fill_in :number, with: 'AB123'
          click_button 'Continue'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter a valid National Insurance number')
        end

        scenario 'I expect the incorrect data to be shown' do
          expect(page).to have_xpath('//input[@id="national_insurance_number" and @value="AB123"]')
        end
      end
    end
  end
end
