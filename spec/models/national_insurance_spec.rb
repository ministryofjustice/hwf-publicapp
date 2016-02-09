require 'rails_helper'

RSpec.describe NationalInsurance, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'number' do
      context 'when provided' do
        before { subject.number = 'AB123456A' }

        it { expect(subject.valid?).to be true }
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
end
