require "selenium/webdriver"

caps = {
   :platform => "Windows 7",
   :browserName => "Chrome",
   :version => "45"
}

BROWSER_MATRIX = JSON.parse(IO.read('features/support/sauce_labs/browsers/browsers.json'), symbolize_names: true)

def self.config
  @config ||= YAML.load_file(Rails.root + 'config/sauce_labs.yml')
end

driver = Selenium::WebDriver.for(:remote,
                                :url => "http://#{config['username']}:#{config['authkey']}@ondemand.saucelabs.com:80/wd/hub",
                                :desired_capabilities => caps)

driver.get('http://localhost:3000')

puts "title of webpage is: #{driver.title()}"

driver.quit()
