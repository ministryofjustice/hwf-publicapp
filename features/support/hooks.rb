Before('@step54') do
  url = 'URL '
  response = { 'result' => 'RESPONSE' }
  binding.pry
  stub_request(:all, "#{url}/api/submissions").to_return(status: 200, body: response.to_json)
end