# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  context 'I want to be able to apply for help with fees for my ET case' do
    before do
      given_the_submission_service_is_available
      when_they_apply_for_help_with_et_case
      expect(page).to have_content 'Your application for help with fees is not finished yet'
    end

    scenario 'I expect to see instructions how to finish application' do
      expect(page).to have_content 'You must email or post this help with fees reference number HWF-ABC123 along with your employment tribunal claim number to the relevant Employment Tribunal Central Office.'
      expect(page).to have_content 'Email or send your letter to the relevant Employment Tribunal Central Office detailed below.'
    end

    scenario 'I expect to "What happens next?" instructions' do
      within(:xpath, ".//div[@class='steps-panel']") do
        expect(page).to have_text 'What happens next?'
        expect(page.find(:xpath, './/ol/li[1]').text).to eql 'Your help with fees application will be assessed by staff at our Central Office.'
        expect(page.find(:xpath, './/ol/li[2]').text).to eql 'The Central Office will let you know the outcome of your help with fees application, or if they need more information from you. This usually takes no longer than 5 working days.'
        expect(page).not_to have_xpath('.//ol/li[3]')
        expect(page).not_to have_text('If your application for help with fees is successful, you’ll hear directly from the tribunal dealing with your case.')
      end
    end
  end
end
