# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'when accessing the "fee" page for "Help with fees"' do
    before { given_user_answers_questions_up_to(:fee) }

    context 'completing a non-refund form correctly' do
      before do
        choose 'fee_paid_false'
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "marital-status" page' do
        expect(page).to have_content 'Are you single, married or living with someone and sharing an income?'
      end
    end

    context 'not completing the page correctly' do
      describe 'leaving the fields empty' do
        before { click_button 'Continue' }

        scenario 'I expect to be shown the "fee" page with error block' do
          expect(page).to have_content 'You need to fix the errors on this page before continuing.'
        end

        scenario 'I expect the fields to have specific errors' do
          expect(page).to have_xpath('//span[@class="error-message"]', text: "Select whether you've already paid the fee")
        end
      end

      describe 'selecting yes to fee paid' do
        before { choose 'fee_paid_true' }

        describe 'leaving date_paid blank' do
          before { click_button 'Continue' }

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message" and .="Enter the date in this format DD/MM/YYYY"]')
          end
        end

        describe 'providing an invalid date' do
          before do
            fill_in :fee_date_paid_day, with: '1'
            fill_in :fee_date_paid_month, with: '45'
            fill_in :fee_date_paid_year, with: '2016'
            click_button 'Continue'
          end

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter the date in this format DD/MM/YYYY')
          end

          scenario 'I expect the incorrect data to be shown' do
            expect(page).to have_xpath('//input[@id="fee_date_paid_day" and @value="1"]')
            expect(page).to have_xpath('//input[@id="fee_date_paid_month" and @value="45"]')
            expect(page).to have_xpath('//input[@id="fee_date_paid_year" and @value="2016"]')
          end
        end

        describe 'when the date is too old' do
          before do
            fill_in :fee_date_paid_day, with: 4.months.ago.day
            fill_in :fee_date_paid_month, with: 4.months.ago.month
            fill_in :fee_date_paid_year, with: 4.months.ago.year
            click_button 'Continue'
          end

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: 'The application must have been made in the last 3 months')
          end

          scenario 'I expect the incorrect data to be shown' do
            expect(page).to have_xpath("//input[@id='fee_date_paid_day' and @value='#{4.months.ago.day}']")
            expect(page).to have_xpath("//input[@id='fee_date_paid_month' and @value='#{4.months.ago.month}']")
            expect(page).to have_xpath("//input[@id='fee_date_paid_year' and @value='#{4.months.ago.year}']")
          end
        end

        describe 'when the date is in the future' do
          before do
            fill_in 'fee_date_paid', with: Time.zone.now + 1.month
            click_button 'Continue'
          end

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: "This date can't be in the future")
          end

          scenario 'I expect the incorrect data to be shown' do
            expect(page).to have_xpath("//input[@id='fee_date_paid' and @value='#{(Time.zone.now + 1.month).strftime('%d/%m/%Y')}']")
          end
        end
      end
    end
  end
end
