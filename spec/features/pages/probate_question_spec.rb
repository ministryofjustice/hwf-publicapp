# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "probate" page for "Help with fees"' do
    before { page.visit 'probate' }

    context 'completing the form correctly' do
      before do
        choose 'probate_kase_true'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "claim" page' do
        expect(page).to have_content 'Do you have a case, claim or ‘notice to pay’ number? '
      end
    end

    context 'not completing the page correctly' do
      before do
        click_button 'Continue'
      end

      scenario 'I expect to be shown the "probate" page with error block' do
        expect(page).to have_content 'You need to fix the errors on this page before continuing.'
      end

      scenario 'I expect the fields to have specific errors' do
        expect(page).to have_xpath('//span[@class="error-message"]', text: "Select whether you're paying a fee for a probate case")
      end
    end
  end
end
