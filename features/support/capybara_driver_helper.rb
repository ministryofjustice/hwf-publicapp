Capybara.configure do |config|
  driver = ENV['DRIVER']&.to_sym || :poltergeist
  config.default_driver = driver
  config.default_max_wait_time = 30
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
  config.visible_text_only = true
end

Capybara.register_driver :poltergeist do |app|
  if ENV['ZAP_PROXY']
    phantomjs_proxy = ["--proxy=#{ENV['ZAP_PROXY']}:#{ENV['ZAP_PROXY_PORT']}"]
    Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 60,
                                           phantomjs_options: phantomjs_proxy)
  else
    Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 60)
  end
end

Capybara.register_driver :saucelabs do |app|
  browser = Settings.saucelabs.browsers.send(Settings.saucelabs.browser).to_h

  Capybara::Selenium::Driver.new(app, browser: :remote, url: Settings.saucelabs.url, desired_capabilities: browser)
end

Capybara.register_driver :firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.cache.disk.enable'] = false
  profile['browser.cache.memory.enable'] = false
  Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

if ENV.key?('CIRCLE_ARTIFACTS')
  Capybara.save_and_open_page_path = ENV['CIRCLE_ARTIFACTS']
end

Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end

Capybara.register_driver :safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

Capybara::Screenshot.register_filename_prefix_formatter(:cucumber) do |scenario|
  title = scenario.title.tr(' ', '-').gsub(%r{/^.*\/cucumber\//}, '')
  "screenshot_cucumber_#{title}"
end

Capybara.javascript_driver = Capybara.default_driver
Capybara.current_driver = Capybara.default_driver
Capybara.server_host = ENV['CAPYBARA_SERVER_HOST'] || '0.0.0.0'
Capybara.server_port = ENV['CAPYBARA_SERVER_PORT'] || '3000'
Capybara.app_host = "http://#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}"
