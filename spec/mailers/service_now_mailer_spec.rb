require "rails_helper"

RSpec.describe ServiceNowMailer, type: :mailer do
  describe "#ask_for_help_email" do
    let(:form) { instance_double(Forms::HelpRequest, name: 'John Doe', email: 'johndoe@example.com', description: 'Test') }
    let(:mail) { described_class.ask_for_help_email(form) }

    it 'renders the body' do
      expect(mail.body).to eq(form.description)
    end

    it 'uses the form email field in Reply-To header' do
      expect(mail.reply_to).to eq(['johndoe@example.com'])
    end

    it 'renders the subject' do
      expect(mail.subject).to include('[Ask-for-Help]')
    end

    it 'uses the hwf no-reply email in the From header' do
      expect(mail.from).to eq(['no-reply@helpwithcourtfees.service.gov.uk'])
    end
  end
end
