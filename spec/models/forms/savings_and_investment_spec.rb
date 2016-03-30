require 'rails_helper'

RSpec.describe Forms::SavingsAndInvestment, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'less_than_limit' do
      context 'when true' do
        before { subject.less_than_limit = true }

        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.less_than_limit = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.less_than_limit = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end

  describe '#export' do
    subject { described_class.new(less_than_limit: less_than_limit).export }

    context 'when less_than_limit is true' do
      let(:less_than_limit) { true }

      it 'returns hash with threshold_exceeded parameter false' do
        is_expected.to eql(threshold_exceeded: false)
      end
    end

    context 'when less_than_limit is false' do
      let(:less_than_limit) { false }

      it 'returns hash with threshold_exceeded parameter true' do
        is_expected.to eql(threshold_exceeded: true)
      end
    end
  end
end
