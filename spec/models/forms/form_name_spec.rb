require 'rails_helper'

RSpec.describe Forms::FormName, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'identifier' do
      context 'when provided' do
        before { subject.identifier = 'N1' }

        it { expect(subject.valid?).to be true }
      end

      context 'when not provided' do
        before { subject.identifier = '' }

        it { expect(subject.valid?).to be true }
      end
    end
  end

  describe '#export' do
    subject { described_class.new(identifier: identifier).export }

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
