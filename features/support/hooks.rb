Before('@hwf_submit_application') do
  url = ENV['SUBMISSION_URL']
  response = { result: true, message: 'HWF-000-000' }
  stub_request(:post, "#{url}/api/submissions").to_return(status: 200, body: response.to_json)
end

Before('@zap') do
  IO.popen('/Applications/ZAP\ 2.6.0.app/Contents/Java/zap.sh -daemon')
end

Around('@inaccessible') do |block|
  Capybara::Accessible.skip_audit { block.call }
end
