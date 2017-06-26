require "selenium/webdriver"

caps = {
    :platform => "Windows 7",
    :browserName => "Chrome",
    :version => "45"
}

driver = Selenium::WebDriver.for(:remote,
                                 :url => "http://aballantine:c09c4ae6-c68f-419d-b09a-922404c5bb23@ondemand.saucelabs.com:80/wd/hub",
                                 :desired_capabilities => caps)

driver.get('http://saucelabs.com/test/guinea-pig')

puts "title of webpage is: #{driver.title()}"

driver.quit()