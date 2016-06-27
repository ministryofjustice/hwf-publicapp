# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "applicant-address" page for "Help with fees"' do
    before { given_user_answers_questions_up_to(:applicant_address) }

    context 'completing the form correctly' do
      before do
        fill_in :applicant_address_address, with: '10, The Street'
        fill_in :applicant_address_postcode, with: 'PO5T 0DE'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "contact" page' do
        expect(page).to have_content "What's your email address?"
      end
    end

    context 'not completing the page correctly' do
      describe 'by omitting the address' do
        before do
          fill_in :applicant_address_postcode, with: 'PO5T 0DE'
          click_button 'Continue'
        end

        scenario 'I expect to be shown the "applicant-address" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter your address')
        end
      end

      describe 'by omitting the postcode' do
        before do
          fill_in :applicant_address_address, with: '10, The Street'
          click_button 'Continue'
        end

        scenario 'I expect to be shown the "applicant-address" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter your postcode')
        end
      end
    end
  end
end
