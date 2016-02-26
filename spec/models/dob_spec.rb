require 'rails_helper'

RSpec.describe Dob, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'date_of_birth' do
      context 'when not blank' do
        before { subject.date_of_birth = '23/01/1980' }

        it { expect(subject.valid?).to be true }
      end

      context 'when a non date value' do
        before { subject.date_of_birth = 'some string' }

        it { expect(subject.valid?).not_to be true }
      end

      context 'when passed a two digit year' do
        before { subject.date_of_birth = '1/11/80' }

        it { expect(subject.valid?).not_to be true }

        it 'returns an error message, if omitted' do
          subject.valid?
          expect(subject.errors[:date_of_birth]).to eq ['Enter the date in this format DD/MM/YYYY']
        end
      end

      context 'when blank' do
        before { subject.date_of_birth = '' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
