require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "contact" page for "Help with fees"' do
    before { given_user_answers_questions_up_to(:contact) }

    context 'completing the form correctly' do
      before do
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "summary" page' do
        expect(page).to have_content 'Check details'
      end
    end

    context 'not completing the page correctly' do
      describe 'entering invalid email text ' do
        before do
          fill_in :contact_email, with: 'foobar.com'
          click_button 'Continue'
        end

        scenario 'I expect to be shown the "contact" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Please enter a valid email address in the format yourname@example.com')
        end
      end
    end
  end
end
