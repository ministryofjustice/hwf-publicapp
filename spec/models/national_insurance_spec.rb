require 'rails_helper'

RSpec.describe NationalInsurance, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'number' do
      context 'when provided' do
        before { subject.number = 'AB123456A' }

        it { expect(subject.valid?).to be true }
      end

      context 'when provided in lower case' do
        before { subject.number = 'ab123456a' }

        it { expect(subject.valid?).to be true }

        describe 'transforms the input to uppercase' do
          before { subject.valid? }

          it { expect(subject.number).to eql 'AB123456A' }
        end
      end

      context 'when provided with a space' do
        before { subject.number = 'AB123456A ' }

        it { expect(subject.valid?).to be false }
      end

      context 'when provided with an invalid format' do
        before { subject.number = 'A1 ' }

        it { expect(subject.valid?).to be false }
      end

      context 'when not provided' do
        before { subject.number = '' }

        it { expect(subject.valid?).to be false }
      end
    end
  end

  describe '#export' do
    let(:number) { 'AA123456A' }

    subject { described_class.new(number: number).export }

    it 'returns hash with ni_number set' do
      is_expected.to eql(ni_number: number)
    end
  end

end
