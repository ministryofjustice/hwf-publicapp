# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  before { Timecop.freeze(a_day_before_disable_probate_fees) }
  after { Timecop.return }

  context 'when accessing the "probate" page for "Help with fees"' do
    before { given_user_answers_questions_up_to(:probate) }

    context 'completing the form correctly' do
      before do
        choose 'probate_kase_true'
        fill_in :probate_deceased_name, with: 'foo'
        fill_in :probate_date_of_death, with: Time.zone.yesterday
        click_button 'Continue'
      end

      scenario 'I expect to be routed to the "claim" page' do
        expect(page).to have_content 'Do you have a case, claim or ‘notice to pay’ number? '
      end
    end

    context 'not completing the page correctly' do
      describe 'leaving all fields empty' do
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

      context 'selecting yes to probate case' do
        before { choose :probate_kase_true }

        context 'leaving deceased_name blank' do
          before { click_button 'Continue' }

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: "Please enter the deceased's name")
          end
        end

        context 'leaving date_of_death empty' do
          before { click_button 'Continue' }

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter the date')
          end
        end

        context 'entering date_of_death that is not a date' do
          before do
            fill_in :probate_date_of_death, with: 'foo'
            click_button 'Continue'
          end

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: 'Enter the date in this format DD/MM/YYYY')
          end
        end

        context 'entering date_of_death that is too old' do
          before do
            fill_in :probate_date_of_death, with: Time.zone.today - 21.years
            click_button 'Continue'
          end

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: 'The date of death must have been in the last 20 years')
          end
        end

        context 'entering date_of_death that is in the future' do
          before do
            fill_in :probate_date_of_death, with: Time.zone.tomorrow
            click_button 'Continue'
          end

          scenario 'I expect the fields to have specific errors' do
            expect(page).to have_xpath('//span[@class="error-message"]', text: "This date can't be in the future")
          end
        end
      end
    end
  end

  context 'when completing an ET application' do
    before do
      when_they_go_back_to_homepage_and_start_again
      fill_et_form_name
      fill_fee
      fill_marital_status
      fill_savings_and_investment
      fill_savings_and_investment_extra
      fill_benefit
      fill_dependent
      fill_income_kind
      fill_income_range
      fill_income_amount
    end

    scenario 'the probate page is not rendered' do
      expect(page).to have_content 'Enter your employment tribunal claim number'
    end
  end
end
