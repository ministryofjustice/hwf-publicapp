module SubmissionRequests
  def stub_submission_request(response_status, response_body)
    stub_request(:post, 'http://submit.to.this/api/submissions').
      with(headers: { Authorization: 'Token token=SUBMISSION_TOKEN' }).
      to_return(status: response_status, body: response_body.to_json)
  end
end

module SubmissionRequestSteps
  def given_the_submission_service_is_available(returns_reference = 'HWF-ABC123')
    stub_submission_request(200, result: true, message: returns_reference)
  end
  alias and_the_submission_service_is_available given_the_submission_service_is_available

  def given_the_submission_service_is_unavailable
    stub_submission_request(200, result: false, message: '')
  end
  alias and_the_submission_service_is_unavailable given_the_submission_service_is_unavailable
end

RSpec.configure do |config|
  config.before(:suite) do
    Settings[:submission][:url] = 'http://submit.to.this'
    Settings[:submission][:token] = 'SUBMISSION_TOKEN'
  end

  config.include SubmissionRequests
  config.include SubmissionRequestSteps, type: :feature
end
