# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "form-name" page for "Help with fees"' do
    before { given_user_answers_questions_up_to(:form_name) }

    context 'completing the form correctly' do
      before do
        fill_in :form_name_identifier, with: 'N1'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "fee" page' do
        expect(page).to have_content 'Have you already paid the fee?'
      end
    end

    context 'not completing the page correctly' do
      before do
        click_button 'Continue'
      end

      scenario 'I expect the form_name field to have an error' do
        expect(page).to have_content 'Enter the form name or number, or select \'I don’t know the form name or number\''
      end
    end

    describe 'help with probate fee option' do
      before do
        Capybara.current_driver = :webkit
        Timecop.freeze(probate_fees_release_date) do
          given_user_answers_questions_up_to(:form_name)
        end
        check 'form_name_probate'
      end

      context 'selecting the probate fees option' do
        scenario 'I expect a warning message to appear' do
          expect(page).to have_content('Help with Fees is no longer available for probate applications')
        end

        scenario 'I expect the form name, the form options and the continue button to be disabled' do
          expect(page).to have_css("#form_name_identifier[disabled='disabled']")
          expect(page).to have_css("#form_name_unknown[disabled='disabled']")
          expect(page).to have_css("#form_name_et[disabled='disabled']")
          expect(page).to have_css("input.button[name='commit'][disabled='disabled']")
          expect(page).to have_css("input.button[name='commit'][disabled='disabled']")
        end
      end

      context 'deselecting the probate fees option' do
        before do
          uncheck 'form_name_probate'
        end

        scenario 'I expect the form name, the form options and the continue button to not be disabled' do
          expect(page).not_to have_css("#form_name_identifier[disabled='disabled']")
          expect(page).not_to have_css("#form_name_unknown[disabled='disabled']")
          expect(page).not_to have_css("#form_name_et[disabled='disabled']")
          expect(page).not_to have_css("input.button[name='commit'][disabled='disabled']")
        end

        scenario 'I expect the warning message to disappear' do
          expect(page).not_to have_content('Help with Fees is no longer available for probate applications')
        end
      end
    end
  end
end
