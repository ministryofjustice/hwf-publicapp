require 'rails_helper'

RSpec.describe Forms::HomeOffice, type: :model do
  subject(:form_ho) { described_class.new }

  describe 'validations' do
    describe 'mandatory if no NI number' do
      context 'when NI not provided' do
        before { form_ho.ho_number = 'AB123456A' }

        it { expect(form_ho.valid?).to be true }
      end

      context 'when NI and HO are empty' do
        before {
          form_ho.ho_number = ''
          form_ho.ni_number = ''
        }

        it { expect(form_ho.valid?).to be false }
      end

      context 'when NI is present' do
        before {
          form_ho.ho_number = ''
          form_ho.ni_number = 'ABC'
        }

        it { expect(form_ho.valid?).to be true }
      end

    end
  end

  describe '#export' do
    subject { described_class.new(ho_number: ho_number).export }

    let(:ho_number) { 'AA123456A' }

    it 'returns hash with ho_number set' do
      expect(subject).to eql(ho_number: ho_number)
    end
  end

end
