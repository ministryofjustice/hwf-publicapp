class ZendeskSender
  def send_help_request(help_request)
    if Settings.zendesk.enabled
      ZendeskAPI::Ticket.create!(client, attributes(help_request))
    end
  end

  private

  def client
    @client ||= ZendeskAPI::Client.new do |config|
      config.url = Settings.zendesk.url
      config.username = Settings.zendesk.username
      config.token = Settings.zendesk.token
    end
  end

  def attributes(help_request)
    {
      subject: subject(help_request),
      description: help_request.description,
      requester: {
        name: help_request.name
      },
      custom_fields: custom_fields(help_request)
    }
  end

  def subject(help_request)
    "#{help_request.name} has requested assistance, please call them back on: #{help_request.phone}"
  end

  def custom_fields(help_request)
    [
      { id: '32342378', value: Settings.env },
      { id: '24041286', value: help_request.phone },
      { id: '23757677', value: 'help_with_fees_technical_support' }
    ]
  end
end
