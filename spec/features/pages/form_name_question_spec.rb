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

      scenario 'I expect to be routed to the "national-insurance" page' do
        expect(page).to have_content 'Are you single, married or living with someone and sharing an income?'
      end
    end
  end
end
