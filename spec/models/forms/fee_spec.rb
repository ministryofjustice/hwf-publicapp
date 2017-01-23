require 'rails_helper'

RSpec.describe Forms::Fee, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'paid' do
      context 'when true' do
        before { subject.paid = true }

        context 'and date_paid is completed' do
          before { subject.date_paid = Time.zone.yesterday }

          it { expect(subject.valid?).to be true }
        end

        context 'and date_paid is not completed' do
          before { subject.date_paid = nil }

          it { expect(subject.valid?).to be false }
        end
      end

      context 'when false' do
        before { subject.paid = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.paid = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end

  describe '#export' do
    subject { described_class.new(paid: paid, date_paid: date_paid).export }

    let(:date_paid) { Date.parse('12/12/2015') }

    context 'when paid is true' do
      let(:paid) { true }

      it 'returns hash with refund true and date_fee_paid set' do
        is_expected.to eql(refund: true, date_fee_paid: date_paid)
      end
    end

    context 'when paid is false' do
      let(:paid) { false }

      it 'returns hash with refund false dna date_fee_paid nil' do
        is_expected.to eql(refund: false, date_fee_paid: nil)
      end
    end
  end

end
