# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "fee" page for "Help with fees"' do
    before { page.visit 'fee' }

    context 'completing a non-refund form correctly' do
      before do
        choose 'fee_paid_false'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "fee" page' do
        expect(page).to have_content 'Are you paying a fee for a probate case?'
      end
    end

    context 'completing a refund form correctly' do
      before do
        choose 'fee_paid_true'
        fill_in 'fee_date_paid', with: Time.zone.yesterday
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "fee" page' do
        expect(page).to have_content 'Are you paying a fee for a probate case?'
      end
    end

    context 'not completing the page correctly' do
      before do
        click_button 'Continue'
      end

      scenario 'I expect to be shown the "fee" page with error block' do
        expect(page).to have_content 'You need to fix the errors on this page before continuing.'
      end

      scenario 'I expect the fields to have specific errors' do
        expect(page).to have_xpath('//span[@class="error-message"]', text: "Select whether you've already paid the fee")
      end
    end
  end
end
