# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "claim" page for "Help with fees"' do
    before { given_user_answers_questions_up_to(:claim) }

    context 'completing the form correctly' do
      before do
        choose :claim_default_number_true
        fill_in :claim_default_identifier, with: 'N1'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "national-insurance" page' do
        expect(page).to have_content 'What is your National Insurance number?'
      end
    end

    context 'not completing the page correctly' do
      describe 'leaving all fields empty' do
        before { click_button 'Continue' }

        scenario 'I expect to be shown the "claim" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Select whether you have a case, claim or ‘notice to pay’ number')
        end
      end

      context 'selecting yes' do
        before { choose :claim_default_number_true }

        context 'leaving case number field empty' do
          before { click_button 'Continue' }

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter a case, claim or ‘notice to pay’ number')
          end
        end
      end
    end
  end
end
