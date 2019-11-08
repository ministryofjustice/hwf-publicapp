require 'rails_helper'

RSpec.describe Forms::ApplicantLitigationDetail, type: :model do
  subject(:form) { described_class.new(litigation_friend_details: litigation_friend_details) }

  let(:litigation_friend_details) { 'As a friend' }


  describe 'validations' do
    describe 'litigation_friend_details' do
      context 'when address not provided' do
        let(:litigation_friend_details) { '' }

        it { is_expected.not_to be_valid }
      end

      context 'when provided' do
        context 'when maximum 99 characters long' do
          it { is_expected.to be_valid }
        end
      end

    end

  end

  describe '#export' do
    subject { form.export }

    it 'returns hash with address and postcode' do
      expect(subject).to eql(litigation_friend_details: litigation_friend_details)
    end
  end

end
