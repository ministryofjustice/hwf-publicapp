require 'rails_helper'

RSpec.describe Views::IncomeThresholds do
  let(:online_application) { build(:online_application, married: married, children: children) }
  subject(:service) { described_class.new(online_application) }

  describe '#min_threshold' do
    subject { service.min_threshold }

    context 'when the applicant is single without kids' do
      let(:married) { false }
      let(:children) { 0 }

      it 'calculates the right minimum threshold' do
        is_expected.to eql(1085)
      end
    end

    context 'when the applicant is single with kids' do
      let(:married) { false }
      let(:children) { 2 }

      it 'calculates the right minimum threshold' do
        is_expected.to eql(1575)
      end
    end

    context 'when the applicant is married without kids' do
      let(:married) { true }
      let(:children) { 0 }

      it 'calculates the right minimum threshold' do
        is_expected.to eql(1245)
      end
    end

    context 'when the applicant is married with kids' do
      let(:married) { true }
      let(:children) { 2 }

      it 'calculates the right minimum threshold' do
        is_expected.to eql(1735)
      end
    end
  end

  describe '#max_threshold' do
    subject { service.max_threshold }

    context 'when the applicant is single without kids' do
      let(:married) { false }
      let(:children) { 0 }

      it 'calculates the right minimum threshold' do
        is_expected.to eql(5085)
      end
    end

    context 'when the applicant is single with kids' do
      let(:married) { false }
      let(:children) { 2 }

      it 'calculates the right minimum threshold' do
        is_expected.to eql(5575)
      end
    end

    context 'when the applicant is married without kids' do
      let(:married) { true }
      let(:children) { 0 }

      it 'calculates the right minimum threshold' do
        is_expected.to eql(5245)
      end
    end

    context 'when the applicant is married with kids' do
      let(:married) { true }
      let(:children) { 2 }

      it 'calculates the right minimum threshold' do
        is_expected.to eql(5735)
      end
    end
  end
end
