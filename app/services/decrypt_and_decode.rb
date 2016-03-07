class DecryptAndDecode
  def initialize(data)
    @object_to_process = data
  end

  def response
    @decrypted_object = decrypt_object
    decoded_object = decode_object
    decoded_object[0]
  rescue => e
    log_and_fail_error e
  end

  private

  def decrypt_object
    cipher = OpenSSL::Cipher.new('aes-256-cbc')
    cipher.decrypt
    cipher.key = Settings.cipher.key
    cipher.iv = Settings.cipher.iv
    decrypted_token = cipher.update(@object_to_process.unpack('m')[0])
    decrypted_token << cipher.final
  rescue OpenSSL::Cipher::CipherError
    log_and_fail_text 'Cannot decrypt message'
  end

  def decode_object
    JWT.decode(@decrypted_object, public_key, true,
      iss: Settings.encryption.staff_app_id, verify_iss: true,
      aud: Settings.encryption.public_app_id, verify_aud: true,
      algorithm: 'ES512')
  rescue JWT::InvalidAudError => e
    log_and_fail_error e
  rescue JWT::InvalidIssuerError => e
    log_and_fail_error e
  rescue JWT::DecodeError
    log_and_fail_text 'Cannot decode message'
  end

  def public_key
    pem = Settings.encryption.public_key
    OpenSSL::PKey.read(pem.gsub("\\n", "\n"))
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
