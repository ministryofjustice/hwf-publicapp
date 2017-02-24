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
  end
end
