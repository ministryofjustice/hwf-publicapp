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
        expect(page).to have_content "Enter a valid form number or select 'I don't have a form'"
      end
    end

    context 'when probate fees are still supported' do
      before do
        Timecop.freeze(a_day_before_disable_probate_fees)
        given_user_answers_questions_up_to(:form_name)
      end

      after { Timecop.return }

      scenario 'I do not expect the warning message to be displayed' do
        expect(page).not_to have_css('#probate-warning')
      end
    end

    context 'when probate fees are no longer supported' do
      scenario 'I expect a warning message to be displayed' do
        Timecop.freeze(probate_fees_release_date) do
          expect(page).to have_css('#probate-warning')
        end
      end
    end
  end
end
