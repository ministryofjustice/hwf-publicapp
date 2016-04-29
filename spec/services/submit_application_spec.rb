require 'rails_helper'

RSpec.describe SubmitApplication do
  let(:url) { 'URL' }
  let(:token) { 'TOKEN' }
  let(:online_application) { build(:online_application) }

  subject(:submit_application) { described_class.new(url, token) }

  describe '#available?' do
    let(:request_path) { "#{url}/ping.json" }

    subject { submit_application.available? }

    context 'when the connection is working' do
      before do
        stub_request(:get, request_path).to_return(status: status)
      end

      context 'when the response status is 200' do
        let(:status) { 200 }

        it { is_expected.to be true }
      end

      context 'when the response status is anything else than 200' do
        let(:status) { 500 }

        it { is_expected.to be false }
      end
    end

    context 'when the connection can not be established' do
      before do
        stub_request(:get, request_path).to_raise
      end

      it { is_expected.to be false }
    end
  end

  describe '#post' do
    subject(:post) { submit_application.post(online_application) }

    describe 'when the request is valid' do
      let(:response) { { 'result' => 'RESPONSE' } }
      let(:expected_response) { { result: 'RESPONSE' } }

      before do
        stub_request(:post, "#{url}/api/submissions").to_return(status: 200, body: response.to_json)
      end

      it 'returns the response with symbilised keys' do
        is_expected.to eql(expected_response)
      end
    end
  end
end
