require 'rails_helper'

RSpec.describe Forms::ApplicantAddress, type: :model do

  subject { described_class.new(address: '1 Foo Road', postcode: 'SW1') }

  describe 'validations' do
    context 'when all the attributes are provided' do
      it { expect(subject.valid?).to be true }
    end

    describe 'address' do
      context 'when address not provided' do
        before { subject.address = '' }

        it { expect(subject.valid?).to be false }
      end
    end

    describe 'postcode' do
      context 'when postcode not provided' do
        before { subject.postcode = '' }

        it { expect(subject.valid?).to be false }
      end
    end
  end

  describe '#export' do
    let(:address) { 'London' }
    let(:postcode) { 'LON DON' }

    subject { described_class.new(address: address, postcode: postcode).export }

    it 'returns hash with address and postcode' do
      is_expected.to eql(address: address, postcode: postcode)
    end
  end

end
