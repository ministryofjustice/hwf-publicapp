class SubmitApplication
  def initialize(encoded_application)
    @payload = encoded_application
  end

  def post
    response = post_data
    begin
      decoded_response = DecryptAndDecode.new(response).response
      JSON.parse(decoded_response['data'])
    rescue => e
      build_error_hash e.message
    end
  end

  private

  def post_data
    RestClient.post "#{Settings.submission.url}/api/v1/online_applications/create",
      build_params,
      build_headers
  end

  def build_params
    { application: @payload }
  end

  def build_headers
    { Authorization: "Token #{Settings.submission.token}" }
  end

  def build_error_hash(message)
    { 'result' => 'error', 'message' => message }
  end
end
