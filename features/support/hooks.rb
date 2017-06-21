Before('@step54') do
  url = ENV['SUBMISSION_URL']
  response = { result: true, message: 'HWF-000-000' }
  stub_request(:post, "#{url}/api/submissions").to_return(status: 200, body: response.to_json)
end
