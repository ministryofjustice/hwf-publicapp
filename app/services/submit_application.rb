class SubmitApplication
  def initialize(url, token)
    @url = url
    @token = token
  end

  def available?
    response = RestClient.get "#{@url}/ping.json"
    response.code == 200
  rescue StandardError
    false
  end

  def post(online_application)
    response = post_data(online_application)
    JSON.parse(response).deep_symbolize_keys
  end

  private

  def post_data(online_application)
    RestClient.post "#{@url}/api/submissions",
                    build_params(online_application),
                    build_headers
  end

  def build_params(online_application)
    { online_application: online_application.as_json }
  end

  def build_headers
    { Authorization: "Token token=#{@token}" }
  end

  def build_error_hash(message)
    { 'result' => 'error', 'message' => message }
  end
end
