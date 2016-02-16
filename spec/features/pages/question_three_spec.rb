# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "benefit" page for "Help with fees"' do
    before { page.visit 'benefit' }

    context 'completing the form correctly' do
      before do
        choose 'benefit_on_benefits_false'
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

      scenario 'I expect to be shown the "benefit" page with error block' do
        expect(page).to have_content 'You need to fix the errors on this page before continuing.'
      end

      scenario 'I expect the fields to have specific errors' do
        expect(page).to have_xpath('//span[@class="error-message"]', text: 'Select your benefit status')
      end
    end
  end
end