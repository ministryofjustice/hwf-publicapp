require 'rails_helper'

RSpec.describe Forms::Dob, type: :model do
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

        describe 'error message' do

          context 'when a string is provided' do
            before { subject.valid? }
            let(:error) { ['Enter the date in this format DD/MM/YYYY'] }

            it { expect(subject.errors.messages[:date_of_birth]).to eq error }
          end

          context 'when a recent date is provided' do
            before do
              subject.date_of_birth = Time.zone.today.strftime("%d/%m/%Y")
              subject.valid?
            end

            let(:error) do
              [I18n.t('activemodel.errors.models.forms/dob.attributes.date_of_birth.too_young', minimum_age: Forms::Dob::MINIMUM_AGE)]
            end

            it { expect(subject.errors.messages[:date_of_birth]).to eq error }
          end

          context 'when a date too far in the past is provided' do
            before do
              subject.date_of_birth = (Time.zone.today - 121.years).strftime("%d/%m/%Y")
              subject.valid?
            end

            let(:error) do
              [I18n.t('activemodel.errors.models.forms/dob.attributes.date_of_birth.too_old')]
            end

            it { expect(subject.errors.messages[:date_of_birth]).to eq error }
          end
        end
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

  describe '#export' do
    subject { described_class.new(date_of_birth: date_of_birth).export }

    let(:date_of_birth) { Date.parse('01/01/1980') }

    it 'returns hash with date_of_birth' do
      is_expected.to eql(date_of_birth: date_of_birth)
    end
  end

end
