require 'rails_helper'

RSpec.describe Forms::IncomeKind, type: :model do
  let(:params) { {} }
  subject(:form) { described_class.new(params) }

  describe 'validations' do
    let(:params) { { kinds: kinds } }

    context 'when kinds is not provided' do
      let(:kinds) { nil }

      it { is_expected.not_to be_valid }
    end

    context 'when kinds is provided' do
      context 'when it has values which are not allowed' do
        let(:kinds) { [2, 50] }

        it { is_expected.not_to be_valid }
      end

      context 'when it is empty' do
        let(:kinds) { [] }

        it { is_expected.not_to be_valid }
      end

      context 'when it has only values which are allowed' do
        let(:kinds) { [2, 5] }

        it { is_expected.to be_valid }
      end
    end
  end

  describe '.allowed_kinds' do
    subject { described_class.allowed_kinds }

    it 'returns an array of indexes of allowed income kinds' do
      is_expected.to eql([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13])
    end
  end

  describe '#export' do
    let(:params) { { kinds: [1, 5] } }
    subject { form.export }

    it 'returns an empty hash' do
      is_expected.to eql({})
    end
  end

  describe '#permitted_attributes' do
    subject { form.permitted_attributes }

    it 'permits the kinds attribute as an array' do
      is_expected.to eql([kinds: []])
    end
  end

  describe '#update_attributes' do
    subject do
      form.update_attributes(attributes)
      form.kinds
    end

    context 'when the attributes contain kinds key' do
      let(:attributes) { { kinds: kinds } }

      context 'when it contains an empty string element' do
        let(:kinds) { [1, '', 5] }

        it 'assigns all but the empty string element' do
          is_expected.to eql([1, 5])
        end
      end

      context 'when it does not contain an empty string element' do
        let(:kinds) { [1, 5] }

        it 'assigns all the elements' do
          is_expected.to eql(kinds)
        end
      end
    end

    context 'when the attributes do not contain kinds key' do
      let(:attributes) { {} }

      it { is_expected.to be_empty }
    end
  end
end
