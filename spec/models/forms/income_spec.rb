require 'rails_helper'

RSpec.describe Forms::Income, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'other_description' do
      context 'when no other income recorded' do

        it { expect(subject.valid?).to be true }
      end

      context 'when other income recorded' do
        before { subject.other = 100.0 }

        it { expect(subject.valid?).to be false }
      end

      context 'when partners other income recorded' do
        before { subject.partner_other = 100.0 }

        it { expect(subject.valid?).to be false }
      end
    end
  end

  describe '#export' do
    subject { described_class.new(wages: wages, other: other, partner_universal_credit: partner_universal_credit).export }

    context 'when some income is set' do
      let(:wages) { 400 }
      let(:other) { 100 }
      let(:partner_universal_credit) { 300 }

      it 'returns hash with all income summarised' do
        is_expected.to eql(income: (wages + other + partner_universal_credit).to_f)
      end
    end

    context 'when no income is set' do
      let(:wages) { nil }
      let(:other) { nil }
      let(:partner_universal_credit) { nil }

      it 'returns hash with income 0' do
        is_expected.to eql(income: 0)
      end
    end

  end

end
