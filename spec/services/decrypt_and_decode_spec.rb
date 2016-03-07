require 'rails_helper'

RSpec.describe DecryptAndDecode do
  include_context 'shared encryption setup'
  before { staff_app_response }

  subject(:received_data) { described_class.new(encrypted_return) }

  it { is_expected.to be_a described_class }

  describe 'methods' do
    describe '.response' do
      subject(:response) { received_data.response }

      it { is_expected.to be_a Hash }

      describe 'data block' do
        subject(:data_block) { response['data'] }

        it { is_expected.to include 'message' }
        it { is_expected.to include 'result' }

      end
    end
  end
end
