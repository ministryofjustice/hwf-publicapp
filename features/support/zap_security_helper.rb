def security_warnings
  #Get response from via RestClient framework method.
  response = JSON.parse RestClient.get "http://#{$zap_proxy}:#{$zap_proxy_port}/json/core/view/alerts"

  #Classify the alerts
  events = response['alerts']
  high_risks = events.select{|x| x['risk'] == 'High'}
  high_count = high_risks.size
  medium_count = events.select{|x| x['risk'] == 'Medium'}.size
  low_count = events.select{|x| x['risk'] == 'Low'}.size
  informational_count = events.select{|x| x['risk'] == 'Informational'}.size

  #Check high alert count and print them
  if high_count > 0
    high_risks.each { |x| p x['alert'] }
  end

  #Expect high alert count equal to 0
  expect(high_count).to eq 0

  #Print alerts with risk levels
  site = Capybara.app_host
  response = JSON.parse RestClient.get "http://#{$zap_proxy}:#{$zap_proxy_port}/json/core/view/alerts",
                                       params: { zapapiformat: 'JSON', baseurl: site }
  response['alerts'].each { |x| p "#{x['alert']} risk level: #{x['risk']}"}
end

#Launch Owasp ZAP
def launch_owasp_zap
  #Set ZAP Path
  $zap_path = determine_os == 'windows' ? 'C:\ZAP\ZAP_2.4.3' : '/Applications/ZAP 2.6.0.app/Contents/Java'
  #Go to ZAP Path
  Dir.chdir($zap_path){
    #Determine Operating System, kill JAVA instances and Start ZAP in deamon mode.
    if determine_os == 'windows'
      system("taskkill /im java.exe /f")
      system("taskkill /im javaw.exe /f")
      IO.popen("zap.bat -daemon")
    else
      system("pkill java")
      IO.popen("./zap.sh -daemon")
    end
    sleep 5
  }
  p "Owasp Zap launch completed"
  sleep 20
end

#Operating System Determination Method
def determine_os
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    return 'windows'
  elsif (/darwin/ =~ RUBY_PLATFORM) != nil
    return 'mac'
  else
    return 'linux'
  end
end