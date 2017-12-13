require 'rails_helper'
require 'moj_hwf/calculator/test/page_objects'
RSpec.describe 'Start calculator session', type: :feature do
  let(:start_page) { MojHwf::Calculator::Test::En::StartPage.new }
  it 'progresses from home page to the first question as suggested by the API' do
    stub_request(:post, 'http://calculator.com:4100/api/calculator/calculation')
    start_page.load_page
    start_page.start_session
  end
end