require 'rails_helper'

RSpec.describe Forms::ApplicantAddress, type: :model do
  subject(:form) { described_class.new(address: address, postcode: postcode) }

  let(:address) { 'London' }
  let(:postcode) { 'LON DON' }

  describe 'validations' do
    describe 'address' do
      context 'when address not provided' do
        let(:address) { '' }

        it { is_expected.not_to be_valid }
      end

      context 'when provided' do
        context 'when more than 99 characters long' do
          let(:address) { 'a' * 100 }

          it { is_expected.not_to be_valid }
        end

        context 'when maximum 99 characters long' do
          let(:address) { 'a' * 99 }

          it { is_expected.to be_valid }
        end
      end

    end

    describe 'postcode' do
      context 'when postcode not provided' do
        let(:postcode) { '' }

        it { is_expected.not_to be_valid }
      end

      context 'when provided' do
        context 'when more than 8 characters long' do
          let(:postcode) { 'p' * 9 }

          it { is_expected.not_to be_valid }
        end

        context 'when maximum 8 characters long' do
          let(:postcode) { 'p' * 8 }

          it { is_expected.to be_valid }
        end
      end

    end
  end

  describe '#export' do
    subject { form.export }

    it 'returns hash with address and postcode' do
      is_expected.to eql(address: address, postcode: postcode)
    end
  end

end
