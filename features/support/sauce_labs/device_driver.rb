module DeviceDriver
  DEFAULT_DEVICES = JSON.load(open('features/support/sauce_labs/default_devices.json'))

  def self.set(device_type)
    device = DEFAULT_DEVICES[device_type]
    resize_window(device['width'], device['height'])
  end

  def self.resize_window(width, height)
    width = ie_8_width_adjust_to_fix_frame(width)
    if Capybara.current_driver == :poltergeist
      Capybara.current_session.driver.browser.resize(width, height)
    else
      window = Capybara.current_session.driver.browser.manage.window
      window.resize_to(width, height)
    end
  end

  def self.ie_8_width_adjust_to_fix_frame(width)
    width += 21 if Capybara.current_driver.to_s.include? 'ie-8'
    width
  end
end
