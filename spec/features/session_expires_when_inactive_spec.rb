require 'rails_helper'

RSpec.feature 'Session expires when inactive' do

  let(:time_started) { Time.zone.now }
  let(:time_expired) { time_started + 61.minutes }

  context 'when user is not using js' do
    scenario 'When user is inactive for given time while answering questions, the session expires' do
      Timecop.freeze(time_started) do
        given_user_fills_in_few_questions
      end
      Timecop.freeze(time_expired) do
        when_they_try_to_proceed_after_long_time
        then_they_are_redirected_to_homepage_with_expiry_message
      end
    end

    scenario 'The session does not expire when on the start page' do
      Timecop.freeze(time_started) do
        given_user_is_reading_the_home_page
      end
      Timecop.freeze(time_expired) do
        when_they_start_new_application
        then_they_are_on_the_first_question
      end
    end
  end

  context 'when user has js enabled', js: true do

    before { Capybara.current_driver = :poltergeist }

    after { Capybara.use_default_driver }

    scenario 'extend session dialog shown before session expires' do
      using_wait_time(5) do
        start = Time.zone.now
        visit '/'
        click_link_or_button 'Apply now'
        visit '/questions/form_name?locale=en&quick=very' # this causes extend session dialog to show after 3 secs
        expect(page).to have_content('Want more time to continue?')
        seconds_since_page_opened = Time.zone.now - start

        expect(seconds_since_page_opened).to be > 3
        expect(current_url).not_to include('/expired')
      end
    end

    scenario 'session expires if you wait long enough' do
      using_wait_time(15) do
        start = Time.zone.now
        visit '/'
        click_link_or_button 'Apply now'
        visit '/questions/form_name?locale=en&quick=very' # this causes client session to expire in 9 secs
        expect(page).to have_content('Your application has been cancelled')
        seconds_since_page_opened = Time.zone.now - start

        expect(seconds_since_page_opened).to be > 9
        expect(current_url).to include('/expired')
      end
    end
  end
end
