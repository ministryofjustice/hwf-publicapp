require 'rails_helper'

RSpec.describe Probate, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'kase' do
      context 'when false' do
        before { subject.kase = false }

        it { expect(subject.valid?).to be true }

        context 'when "deceased_name" is not set' do
          before { subject.deceased_name = nil }

          it { expect(subject.valid?).to be true }
        end

        context 'when "date_of_death" is not set' do
          before { subject.date_of_death = nil }

          it { expect(subject.valid?).to be true }
        end
      end

      context 'when not a boolean value' do
        before { subject.kase = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end

    context 'when "kase" is true' do
      before do
        subject.kase = true
        # also set default 'good' values
        subject.date_of_death = Time.zone.today - 1.month
        subject.deceased_name = 'foo'
      end

      describe 'date of death' do
        describe 'is missing' do
          before { subject.date_of_death = nil }

          it { expect(subject.valid?).to be false }

          context 'it returns an error' do
            before { subject.valid? }

            it { expect(subject.errors[:date_of_death]).to eq ['Enter the date'] }
          end
        end

        describe 'range' do
          context 'exceeds upper bound' do
            before { subject.date_of_death = Time.zone.tomorrow }

            it { expect(subject.valid?).to be false }
          end

          context 'exceeds lower bound' do
            before { subject.date_of_death = Time.zone.today - 21.years }

            it { expect(subject.valid?).to be false }
          end
        end
      end

      describe 'deceased_name' do
        context 'when "deceased_name" is present' do

          it { expect(subject.valid?).to be true }
        end

        context 'when "deceased_name" is not set' do
          before { subject.deceased_name = nil }

          it { expect(subject.valid?).to be false }
        end
      end
    end
  end
end
