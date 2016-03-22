require 'rails_helper'

RSpec.describe Claim, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'number' do
      context 'when true' do
        before do
          subject.number = true
          subject.identifier = 'formy-form'
        end

        describe 'identifier' do
          context 'when not provided' do
            before { subject.identifier = '' }

            it { expect(subject.valid?).to be false }
          end

          context 'when provided' do
            it { expect(subject.valid?).to be true }
          end
        end

        context 'when false' do
          before { subject.number = false }

          it { expect(subject.valid?).to be true }
        end

        context 'when not a boolean value' do
          before { subject.number = 'string' }

          it { expect(subject.valid?).to be false }
        end
      end
    end
  end

  describe '#export' do
    let(:identifier) { 'IDENTIFIER' }

    subject { described_class.new(number: number, identifier: identifier).export }

    context 'when number is true' do
      let(:number) { true }

      it 'returns hash with case_number set' do
        is_expected.to eql(case_number: identifier)
      end
    end

    context 'when number is false' do
      let(:number) { false }

      it 'returns hash with case_number nil' do
        is_expected.to eql(case_number: nil)
      end
    end
  end
end
