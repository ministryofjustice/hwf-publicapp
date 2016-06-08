require 'rails_helper'

RSpec.describe Forms::SavingsAndInvestment, type: :model do
  subject(:form) { described_class.new(choice: choice) }

  describe 'validations' do
    describe 'choice' do
      context 'when "less"' do
        let(:choice) { 'less' }

        it { is_expected.to be_valid }
      end

      context 'when "between"' do
        let(:choice) { 'between' }

        it { is_expected.to be_valid }
      end

      context 'when "more"' do
        let(:choice) { 'more' }

        it { is_expected.to be_valid }
      end

      context 'when neither "less, between or more"' do
        let(:choice) { 'whatever' }

        it { is_expected.to be_invalid }
      end

      context 'when empty' do
        let(:choice) { nil }

        it { is_expected.to be_invalid }
      end
    end
  end

  describe '#export' do
    subject { form.export }

    context 'when choice is "less"' do
      let(:choice) { :less }

      it 'returns hash with threshold_exceeded parameter false' do
        is_expected.to eql(threshold_exceeded: false)
      end
    end

    context 'when choice is "between"' do
      let(:choice) { :between }

      it 'returns hash with threshold_exceeded parameter false' do
        is_expected.to eql(threshold_exceeded: true)
      end
    end

    context 'when choice is "more"' do
      let(:choice) { :more }

      it 'returns hash with threshold_exceeded parameter false' do
        is_expected.to eql(threshold_exceeded: true)
      end
    end
  end
end
