# coding: utf-8
require 'rails_helper'

RSpec.feature 'As a user' do
  scenario 'I want to be able to apply for help with fees for my ET case' do
    given_the_submission_service_is_available

    when_they_apply_for_help_with_et_case
    then_they_see_specific_et_instructions
  end
end
