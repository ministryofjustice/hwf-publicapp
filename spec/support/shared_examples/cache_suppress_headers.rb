# frozen_string_literal: true
RSpec.shared_examples 'cache suppress headers' do
  it 'sets headers to suppress browser cache' do
    expect(response.headers).to include(
      'Cache-Control' => 'no-cache, no-store, max-age=0, must-revalidate',
      'Pragma' => 'no-cache',
      'Expires' => 'Fri, 01 Jan 1990 00:00:00 GMT'
    )
  end
end
