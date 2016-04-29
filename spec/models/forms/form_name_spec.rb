require 'rails_helper'

RSpec.describe Forms::FormName, type: :model do
  subject(:form) { described_class.new(identifier: identifier) }

  describe 'validations' do
    describe 'identifier' do
      context 'when more than 49 characters' do
        let(:identifier) { 'I' * 50 }

        it { is_expected.not_to be_valid }
      end

      context 'when maximum 49 characters long' do
        let(:identifier) { 'I' * 49 }

        it { is_expected.to be_valid }
      end
    end
  end

  describe '#export' do
    subject { form.export }

    context 'when identifier is set and not blank' do
      let(:identifier) { 'IDENTIFIER' }

      it 'returns hash with form_name set' do
        is_expected.to eql(form_name: identifier)
      end
    end

    context 'when identifier is nil' do
      let(:identifier) { nil }

      it 'returns hash with form_name nil' do
        is_expected.to eql(form_name: nil)
      end
    end

    context 'when identifier is blank' do
      let(:identifier) { '  ' }

      it 'returns hash with form_name nil' do
        is_expected.to eql(form_name: nil)
      end
    end
  end

end
