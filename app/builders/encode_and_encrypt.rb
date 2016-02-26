class EncodeAndEncrypt

  def initialize(object)
    @object_to_encrypt = object
    build_jwt
  end

  def encoded_jwt
    encrypt_object
  end

  private

  def build_jwt
    issuer = Settings.encryption.issuer
    audience = Settings.encryption.audience
    pem = Settings.encryption.pem
    key = OpenSSL::PKey.read(pem)

    payload = { data: @object_to_encrypt.to_json, iss: issuer, aud: audience }
    @jwt = JWT.encode payload, key, 'ES512'
  end

  def encrypt_object
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.encrypt
    cipher.key = Settings.cipher.key
    cipher.iv = Settings.cipher.iv
    encrypted_string = cipher.update build_jwt
    encrypted_string << cipher.final
    [encrypted_string].pack('m')
  end
end
