# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "income" page for "Help with fees"' do
    before { given_user_answers_questions_up_to(:income) }

    context 'completing the form correctly' do
      before do
        fill_in :income_wages, with: 100.00
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "fee" page' do
        expect(page).to have_content 'Are you paying a fee for a probate case?'
      end
    end

    context 'not completing the page correctly' do
      describe 'by entering an amount but no income description' do
        before do
          fill_in :income_other, with: 100.00
          click_button 'Continue'
        end

        scenario 'I expect to be shown the "income" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter a description for your income')
        end
      end

      describe 'by entering an income description but no amount' do
        before do
          fill_in :income_other_description, with: 'foo'
          click_button 'Continue'
        end

        scenario 'I expect to be shown the "income" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter the amount of your income')
        end
      end
    end
  end
end
