require 'rails_helper'

RSpec.describe Forms::Probate, type: :model do
  subject(:form) { described_class.new(params) }

  let(:params) { { kase: kase, deceased_name: deceased_name, date_of_death: date_of_death } }

  describe 'validations' do
    let(:deceased_name) { nil }
    let(:date_of_death) { nil }

    describe 'kase' do
      context 'when false' do
        let(:kase) { false }

        it { is_expected.to be_valid }
      end

      context 'when true' do
        let(:kase) { true }
        let(:deceased_name) { 'foo' }
        let(:date_of_death) { Time.zone.today - 1.month }

        context 'time set to past' do
          before { Timecop.freeze(Time.parse("2016-11-01")) }
          after { Timecop.return }

          let(:date_of_death) { 2.day.from_now }

          it "will use correct 'tomorrow' date" do
            expect(subject).not_to be_valid
          end
        end

        describe 'date of death' do
          describe 'when missing' do
            let(:date_of_death) { nil }

            it { is_expected.not_to be_valid }
          end

          describe 'range' do
            context 'exceeds upper bound' do
              let(:date_of_death) { Time.zone.tomorrow }

              it { is_expected.not_to be_valid }
            end

            context 'exceeds lower bound' do
              let(:date_of_death) { Time.zone.today - 21.years }

              it { is_expected.not_to be_valid }
            end
          end
        end

        describe 'deceased_name' do
          context 'when present' do
            context 'when more than 99 characters long' do
              let(:deceased_name) { 'X' * 100 }

              it { is_expected.not_to be_valid }
            end

            context 'when less than 100 characters long' do
              let(:deceased_name) { 'X' * 99 }

              it { is_expected.to be_valid }
            end
          end

          context 'when not set' do
            let(:deceased_name) { nil }

            it { is_expected.not_to be_valid }
          end
        end
      end

      context 'when not a boolean value' do
        let(:kase) { 'string' }

        it { is_expected.not_to be_valid }
      end
    end
  end

  describe '#export' do
    subject { form.export }

    let(:deceased_name) { 'Mr. Deceased' }
    let(:date_of_death) { Date.parse('01/01/2016') }

    context 'when kase is true' do
      let(:kase) { true }

      it 'returns hash with probate true and details set' do
        is_expected.to eql(probate: true, deceased_name: deceased_name, date_of_death: date_of_death)
      end
    end

    context 'when kase is false' do
      let(:kase) { false }

      it 'returns hash with probate false and details nil' do
        is_expected.to eql(probate: false, deceased_name: nil, date_of_death: nil)
      end
    end
  end
end
