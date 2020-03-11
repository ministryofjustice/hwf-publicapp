class ServiceNowMailer < ActionMailer::Base
  default from: Settings.mail.from

  def ask_for_help_email(form)
    mail(to: Settings.mail.service_now,
         reply_to: "#{form.name} <#{form.email}>",
         subject: "[Ask-for-Help] #{form.name} has requested technical assistance",
         content_type: "text/plain",
         body: form.description)
  end
end
