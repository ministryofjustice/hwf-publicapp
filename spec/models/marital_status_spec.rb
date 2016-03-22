require 'rails_helper'

RSpec.describe MaritalStatus, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'married' do
      context 'when true' do
        before { subject.married = true }

        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.married = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.married = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end

  describe '#export' do
    subject { described_class.new(married: married).export }

    context 'when married is true' do
      let(:married) { true }

      it 'returns hash with married parameter true' do
        is_expected.to eql(married: true)
      end
    end

    context 'when married is false' do
      let(:married) { false }

      it 'returns hash with married parameter true' do
        is_expected.to eql(married: false)
      end
    end
  end
end
