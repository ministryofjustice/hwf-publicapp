require 'rails_helper'

RSpec.describe EncodeAndEncrypt do
  include_context 'shared encryption setup'
  before { staff_app_response }

  subject(:encrypted_app) { described_class.new(summary) }

  it { is_expected.to be_a described_class }

  describe 'error handling while creating' do
    subject(:encoded) { encrypted_app.encoded_jwt }

    describe 'when encoding fails' do
      describe 'because the private key env var is missing' do
        before { allow(Settings.encryption).to receive(:private_key).and_return(nil) }

        it 'result is error' do
          expect { subject }.to raise_error('Cannot generate private key')
        end
      end

      describe 'because the cipher key env var is missing' do
        before { allow(Settings.cipher).to receive(:key).and_return(nil) }

        it 'result is error' do
          expect { subject }.to raise_error('Cannot encrypt object')
        end
      end
    end
  end

  describe 'methods' do
    describe '.encoded_jwt' do
      subject(:encoded) { encrypted_app.encoded_jwt }

      it { is_expected.to be_a String }

      describe 'can be decoded using the passkey and iv' do
        subject(:decrypted_token) do
          cipher = OpenSSL::Cipher.new('aes-256-cbc')
          cipher.decrypt
          cipher.key = Settings.cipher.key
          cipher.iv = Settings.cipher.iv
          decrypted_string = cipher.update(encoded.unpack('m')[0])
          decrypted_string << cipher.final
        end

        it { is_expected.to be_a String }

        describe 'that can be decrypted' do
          subject(:decoded_token) { JWT.decode(decrypted_token, my_public_key, true, algorithm: 'ES512') }

          describe 'containing a data block' do
            subject(:data) { JSON.parse(decoded_token[0]['data']) }

            it { is_expected.to be_a Hash }

            it 'with matching values' do
              expect(data['national_insurance_number']).to eql 'AB123456A'
              expect(data['marital_status_married']).to eql 'true'
            end
          end

          describe 'claims' do
            it 'raise an error if issuer does not match' do
              expect {
                JWT.decode decrypted_token, my_public_key, true, iss: 'foo-bar', verify_iss: true, algorithm: 'ES512'
              }.to raise_error JWT::InvalidIssuerError
            end

            it 'raise an error if audience does not match' do
              expect {
                JWT.decode decrypted_token, my_public_key, true, aud: 'foo-bar', verify_aud: true, algorithm: 'ES512'
              }.to raise_error JWT::InvalidAudError
            end
          end
        end
      end
    end
  end
end
