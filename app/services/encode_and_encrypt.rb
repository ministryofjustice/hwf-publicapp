class EncodeAndEncrypt

  def initialize(object)
    @object_to_encrypt = object
    encode_jwt
  end

  def encoded_jwt
    encrypt_object
  end

  private

  def encode_jwt
    issuer = Settings.encryption.public_app_id
    audience = Settings.encryption.staff_app_id
    pem = Settings.encryption.private_key
    key = OpenSSL::PKey.read(pem.gsub("\\n", "\n"))

    payload = { data: @object_to_encrypt.to_json, iss: issuer, aud: audience }
    @jwt = JWT.encode payload, key, 'ES512'
  end

  def encrypt_object
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.encrypt
    cipher.key = Settings.cipher.key
    cipher.iv = Settings.cipher.iv
    encrypted_string = cipher.update @jwt
    encrypted_string << cipher.final
    [encrypted_string].pack('m')
  end
end
