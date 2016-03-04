require 'rails_helper'

RSpec.describe SubmitApplication do
  include_context 'shared encryption setup'
  before { staff_app_response }

  let(:encoded_payload) { EncodeAndEncrypt.new(summary).encoded_jwt }

  subject(:submit_application) { described_class.new(encoded_payload) }

  it { is_expected.to be_a described_class }

  describe 'methods' do
    it { is_expected.to respond_to :post }
  end

  describe '.post' do
    subject(:post) { submit_application.post }

    it { is_expected.to be_a Hash }
    it { is_expected.to include 'result' }
    it { is_expected.to include 'message' }

    describe 'when a valid response is returned' do
      it 'message equals HWF-16-1234' do
        expect(subject['message']). to eql 'HWF-16-1234'
      end
      it 'result is success' do
        expect(subject['result']). to eql 'success'
      end
    end

    describe 'when the staffapp returns data encrypted with the wrong cipher key' do
      before { response_encrypted_with_wrong_cipher }

      it 'result is error' do
        expect(subject['result']). to eql 'error'
        expect(subject['message']). to eql 'Cannot decrypt message'
      end
    end

    describe 'when the staffapp returns data with the the wrong audience claim' do
      before { response_incorrectly_encoded_audience_claim }

      it 'result is error' do
        expect(subject['result']). to eql 'error'
        expect(subject['message']). to start_with 'Invalid audience'
      end
    end

    describe 'when the staffapp returns data with the the wrong issuer claim' do
      before { response_incorrectly_encoded_issuer_claim }

      it 'result is error' do
        expect(subject['result']). to eql 'error'
        expect(subject['message']). to start_with 'Invalid issuer'
      end
    end
  end
end
