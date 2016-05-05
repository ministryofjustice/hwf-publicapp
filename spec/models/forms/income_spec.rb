require 'rails_helper'

RSpec.describe Forms::Income, type: :model do
  subject(:form) { described_class.new(params) }

  describe 'validations' do
    let(:other_description) { '' }
    let(:other) { nil }
    let(:partner_other) { nil }

    let(:params) { { other_description: other_description, other: other, partner_other: partner_other } }

    describe 'other_description' do
      context 'when empty' do
        context 'when no other income recorded' do
          it { is_expected.to be_valid }
        end

        context 'when other income recorded' do
          let(:other) { 100.0 }

          it { is_expected.not_to be_valid }
        end

        context 'when partners other income recorded' do
          let(:partner_other) { 100.0 }

          it { is_expected.not_to be_valid }
        end
      end

      context 'when provided' do
        let(:other_description) { 'd' * 19 }

        context 'when other income or other partner income is empty' do
          let(:other) { 100 }

          context 'when the description more than 19 characters' do
            let(:other_description) { 'd' * 20 }

            it { is_expected.not_to be_valid }
          end

          context 'when the description is less than 20 characters' do
            it { is_expected.to be_valid }
          end
        end

        context 'when other income or other partner income is empty' do
          it { is_expected.not_to be_valid }
        end
      end
    end
  end

  describe '#export' do
    let(:params) { { wages: wages, other: other, partner_universal_credit: partner_universal_credit } }

    subject { form.export }

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

      it 'returns hash with income nil' do
        is_expected.to eql(income: nil)
      end
    end

  end

end
