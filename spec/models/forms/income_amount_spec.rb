require 'rails_helper'

RSpec.describe Forms::IncomeAmount, type: :model do
  subject(:form) { described_class.new(amount: amount) }

  let(:amount) { nil }

  describe 'validations' do
    describe 'amount' do
      context 'when no amount set' do
        let(:amount) { nil }

        it { is_expected.to be_invalid }
      end

      context 'when the amount is set' do
        context 'when less than 0' do
          let(:amount) { -1 }

          it { is_expected.to be_invalid }
        end

        context 'when more than 1 000 000' do
          let(:amount) { 1000001 }

          it { is_expected.to be_invalid }
        end

        context 'when within the thresholds' do
          let(:amount) { 3000 }

          it { is_expected.to be_valid }
        end
      end
    end
  end

  describe '#export' do
    subject { form.export }

    context 'when the amount is set' do
      let(:amount) { 2452 }

      it 'returns hash with income parameter set' do
        is_expected.to eql(income: amount)
      end
    end

    context 'when the amount is not set' do
      let(:amount) { nil }

      it 'returns an ampty hash' do
        is_expected.to eql({})
      end
    end
  end
end
