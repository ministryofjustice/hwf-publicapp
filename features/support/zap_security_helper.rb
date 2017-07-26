def security_warnings
  # Classify the alerts
  events = JSON.parse RestClient.get("http://#{$zap_proxy}:#{$zap_proxy_port}/json/core/view/alerts")
  p events
  high_risks = events.select { |x| x['risk'] == 'High' }
  high_count = high_risks.size

  # Check high alert count and print them
  high_risks.each { |x| p x['alert'] } if high_count.positive?

  # Expect high alert count equal to 0
  expect(high_count).to eq 0

  # Print alerts with risk levels
  site = Capybara.app_host
  response = JSON.parse RestClient.get "http://#{$zap_proxy}:#{$zap_proxy_port}/json/core/view/alerts", params: { zapapiformat: 'JSON', baseurl: site }
  response['alerts'].each { |x| p "# {x['alert']} risk level: #{x['risk']}" }
end

# Launch Owasp ZAP
def launch_owasp_zap
  # Set ZAP Path
  $zap_path = determine_os == 'windows' ? 'C:\ZAP\ZAP_2.4.3' : '/Applications/ZAP 2.6.0.app/Contents/Java'
  # Go to ZAP Path
  Dir.chdir($zap_path) do
    # Determine Operating System, kill JAVA instances and Start ZAP in deamon mode.
    IO.popen("./zap.sh -daemon -config view.mode=attack -config api.disablekey=true -addoninstall pscanrulesBeta -addoninstall ascanrulesAlpha")
    sleep 5
  end
  p "Owasp Zap launch completed"
  sleep 20
end

# Operating System Determination Method
def determine_os
  if !(/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
    'windows'
  elsif !(/darwin/ =~ RUBY_PLATFORM).nil?
    'mac'
  else
    'linux'
  end
end
