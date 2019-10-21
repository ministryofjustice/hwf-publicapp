RSpec.shared_examples 'cache suppress headers' do
  it 'sets headers to suppress browser cache' do
    expect(response.headers).to include(
      'Cache-Control' => 'no-cache, no-store, max-age=0, must-revalidate',
      'Pragma' => 'no-cache',
      'Expires' => 'Fri, 01 Jan 1990 00:00:00 GMT'
      "X-Frame-Options"=>"SAMEORIGIN",
      "X-XSS-Protection"=>"1; mode=block",
      "X-Content-Type-Options"=>"nosniff",
      "X-Download-Options"=>"noopen",
      "X-Permitted-Cross-Domain-Policies"=>"none",
      "Referrer-Policy"=>"strict-origin-when-cross-origin",
      "Content-Type"=>"text/html; charset=utf-8",
      "Cache-Control"=>"no-cache, no-store",
      "Pragma"=>"no-cache",
      "Expires"=>"Fri, 01 Jan 1990 00:00:00 GMT"

    )
  end
end
