# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "personal-details" page for "Help with fees"' do
    before { page.visit 'personal-detail' }

    context 'completing the form correctly' do
      before do
        fill_in :personal_detail_title, with: 'Mr'
        fill_in :personal_detail_first_name, with: 'Foo'
        fill_in :personal_detail_last_name, with: 'Bar'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "applicant-address" page' do
        expect(page).to have_content 'What is your address?'
      end
    end

    context 'not completing the page correctly' do
      describe 'leaving the last_name field empty' do
        before do
          fill_in :personal_detail_first_name, with: 'Foo'
          click_button 'Continue'
        end

        scenario 'I expect to be shown the "personal-details" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter your last name')
        end
      end

      describe 'leaving the first_name field empty' do
        before do
          fill_in :personal_detail_last_name, with: 'Bar'
          click_button 'Continue'
        end

        scenario 'I expect to be shown the "personal-details" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter your first name')
        end
      end
    end
  end
end
