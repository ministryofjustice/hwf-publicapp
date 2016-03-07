class EncodeAndEncrypt

  def initialize(object)
    @object_to_encrypt = object
  end

  def encoded_jwt
    encode_jwt
    encrypt_object
  rescue => e
    log_and_fail_error e
  end

  private

  def encode_jwt
    @jwt = JWT.encode payload, key, 'ES512'
  rescue => e
    log_and_fail_error e
  end

  def encrypt_object
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.encrypt
    cipher.key = Settings.cipher.key
    cipher.iv = Settings.cipher.iv
    encrypted_string = cipher.update @jwt
    encrypted_string << cipher.final
    [encrypted_string].pack('m')
  rescue
    log_and_fail_text 'Cannot encrypt object'
  end

  def payload
    issuer = Settings.encryption.public_app_id
    audience = Settings.encryption.staff_app_id
    { data: @object_to_encrypt.to_json, iss: issuer, aud: audience }
  end

  def key
    pem = Settings.encryption.private_key
    OpenSSL::PKey.read(pem.gsub("\\n", "\n"))
  rescue
    log_and_fail_text 'Cannot generate private key'
  end

  def log_and_fail_error(error)
    log error.message
    fail error.message
  end

  def log_and_fail_text(message)
    log message
    fail message
  end

  def log(message)
    Rails.logger.error "DecryptAndDecode #{message}"
    Rails.logger.debug @object_to_process.to_json
  end
end
