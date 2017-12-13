MojHwf::Calculator.config do |c|
  c.api_root = Settings.submission.url + '/api/calculator'
  c.api_token = Settings.submission_token
end
