module SauceDriver
  class << self
    def config
      @config ||= YAML.load_file(Rails.root + 'config/saucelabs.yml')
    end

    def sauce_endpoint
      "http://#{config['username']}:#{config['authkey']}@ondemand.saucelabs.com:80/wd/hub"
    end

    def browser
      {
        platform: "Mac OS X 10.9",
        browserName: "Chrome",
        version: "31"
      }
    end
  end
end
