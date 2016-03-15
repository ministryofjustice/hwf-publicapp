# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "contact" page for "Help with fees"' do
    before { page.visit question_path(:contact) }

    context 'completing the form correctly' do
      before do
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "summary" page' do
        expect(page).to have_content 'Check details'
      end
    end

    context 'not completing the page correctly' do
      context 'selecting email' do
        before { check :contact_email_option }

        describe 'leaving the email text empty' do
          before { click_button 'Continue' }
          scenario 'I expect to be shown the "contact" page with error block' do
            expect(page).to have_content 'You need to fix the errors on this page before continuing.'
          end

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter a valid email address')
          end
        end
      end
    end
  end
end
