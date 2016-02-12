# coding: utf-8
require 'rails_helper'

RSpec.describe Views::Summary do

  let(:session) { { marital_status_married: 'true' } }
  subject { described_class.new(session) }

  it { is_expected.to respond_to :marital_status_married }
  it { is_expected.to respond_to :savings_and_investment_less_than_limit }
  it { is_expected.to respond_to :benefit_on_benefits }
  it { is_expected.to respond_to :fee_paid }
  it { is_expected.to respond_to :probate_kase }
  it { is_expected.to respond_to :claim_number }
  it { is_expected.to respond_to :form_name_identifier }
  it { is_expected.to respond_to :national_insurance_number }
end
