def staff_app_response
  stub_request(:post, "#{Settings.submission.url}/api/v1/online_applications/create").
    to_return(status: 200, body: encrypted_return, headers: {})
end

def response_encrypted_with_wrong_cipher
  stub_request(:post, "#{Settings.submission.url}/api/v1/online_applications/create").
    to_return(status: 200, body: encrypted_with_wrong_cipher, headers: {})
end

def response_incorrectly_encoded_audience_claim
  stub_request(:post, "#{Settings.submission.url}/api/v1/online_applications/create").
    to_return(status: 200, body: encrypted_properly_encoded_with_wrong_audience, headers: {})
end

def response_incorrectly_encoded_issuer_claim
  stub_request(:post, "#{Settings.submission.url}/api/v1/online_applications/create").
    to_return(status: 200, body: encrypted_properly_encoded_with_wrong_issuer, headers: {})
end
