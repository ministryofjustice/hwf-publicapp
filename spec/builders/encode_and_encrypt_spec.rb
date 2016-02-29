require 'rails_helper'

RSpec.describe EncodeAndEncrypt do
  before do
    allow(Settings.encryption).to receive(:issuer).and_return('hwf-public-app')
    allow(Settings.encryption).to receive(:audience).and_return('fr-staff-app')
    allow(Settings.encryption).to receive(:pem).and_return(private_key.to_pem)
    allow(Settings.encryption).to receive(:hmac).and_return(SecureRandom.hex(64))
    allow(Settings.cipher).to receive(:key).and_return(cipher.random_key)
    allow(Settings.cipher).to receive(:iv).and_return(cipher.random_iv)
  end

  let(:private_key) do
    ecdsa_key = OpenSSL::PKey::EC.new 'secp521r1'
    ecdsa_key.generate_key
    ecdsa_key
  end

  let(:public_key) do
    ecdsa_public = OpenSSL::PKey::EC.new private_key
    ecdsa_public.private_key = nil
    ecdsa_public
  end

  let(:cipher) do
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.encrypt
  end

  let(:session) do
    {
      national_insurance: { 'number' => 'AB123456A' },
      marital_status: { 'married' => 'true' }
    }
  end

  let(:summary) { Views::Summary.new(session) }
  subject(:encrypted_app) { described_class.new(summary) }

  it { is_expected.to be_a described_class }

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
          subject(:decoded_token) { JWT.decode(decrypted_token, public_key, true, algorithm: 'ES512') }

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
                JWT.decode decrypted_token, public_key, true, iss: 'foo-bar', verify_iss: true, algorithm: 'ES512'
              }.to raise_error JWT::InvalidIssuerError
            end

            it 'raise an error if audience does not match' do
              expect {
                JWT.decode decrypted_token, public_key, true, aud: 'foo-bar', verify_aud: true, algorithm: 'ES512'
              }.to raise_error JWT::InvalidAudError
            end
          end
        end
      end
    end
  end
end
