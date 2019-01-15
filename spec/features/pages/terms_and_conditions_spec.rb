require 'rails_helper'

RSpec.feature 'As a user' do
  context 'I should be able to see Terms and Condiction page and' do
    before do
      visit '/'
      click_on 'Terms and conditions'
    end

    scenario "General terms and conditions section" do
      click_link "General terms and conditions"
      expect(page).to have_xpath(".//h2[contains(.,'General terms and conditions')]")
      expect(page).to have_text("These terms and conditions affect your rights and liabilities under the law.")
    end

    scenario "Information provided by this service section" do
      click_link "Information provided by this service"
      expect(page).to have_xpath(".//h2[contains(.,'Information provided by this service')]")
      expect(page).to have_text("This service provides information to support your claim or application.")
    end

    scenario "Applicable law" do
      click_link "Applicable law"
      expect(page).to have_xpath(".//h2[contains(.,'Applicable law')]")
      expect(page).to have_text("Your use of this service and any dispute arising from its use")
    end

    scenario "Responsible use of this service section" do
      click_link "Responsible use of this service"
      expect(page).to have_xpath(".//h2[contains(.,'Responsible use of this service')]")
      expect(page).to have_text("There are risks in using a shared computer (e.g. in an internet café), to access this service.")
    end

    scenario "General Data Protection Regulations (GDPR) section" do
      click_link "General Data Protection Regulations (GDPR)"
      expect(page).to have_xpath(".//h2[contains(.,'General Data Protection Regulations (GDPR)')]")
    end

    scenario "HMCTS privacy notice section" do
      click_link "HMCTS privacy notice"
      expect(page).to have_xpath(".//h2[contains(.,'HMCTS privacy notice')]")
      expect(page).to have_text("These terms and conditions affect your rights and liabilities under the law.")

      expect(page).to have_xpath(".//span[contains(.,'Purpose')]")
      expect(page).to have_text("This privacy notice sets out the standards that you can expect from the Ministry of Justice and Her Majesty’s Courts and Tribunals Service (HMCTS)")

      expect(page).to have_xpath(".//span[contains(.,'About personal data')]")
      expect(page).to have_text("Personal data is information that relates to a living individual who can be identified from the data.")

      expect(page).to have_xpath(".//span[contains(.,'Personal data that we collect')]")
      expect(page).to have_text("We collect the following data when you use this service:")

      expect(page).to have_xpath(".//span[contains(.,'How we use your personal data')]")
      expect(page).to have_text("We use your personal data to complete a claim to for Help with Fees.")

      expect(page).to have_xpath(".//span[contains(.,'How we use non-personal data')]")
      expect(page).to have_text("Separately from the data entered by those using this service, we also collect site-usage data from this service")

      expect(page).to have_xpath(".//span[contains(.,'How your personal data is stored')]")
      expect(page).to have_text("MOJ takes data security very seriously and we take every step to ensure that your data remains private and secure.")

      expect(page).to have_xpath(".//span[contains(.,'How non-personal data is stored')]")
      expect(page).to have_text("Non-personal session information as described in the above section is stored on our secure servers within EEA.")

      expect(page).to have_xpath(".//span[contains(.,'Keeping your data secure')]")
      expect(page).to have_text("Transmitting information over the internet is generally not completely secure, and we cannot guarantee the security of your data.")

      expect(page).to have_xpath(".//span[contains(.,'Disclosing your data')]")
      expect(page).to have_text("We may pass on your personal data if we have a legal obligation to do so.")

      expect(page).to have_xpath(".//span[contains(.,'Access to personal information')]")
      expect(page).to have_text("You can find out if we hold any personal data about you by making a ‘subject access request’.")

      expect(page).to have_xpath(".//span[contains(.,'Complaints')]")
      expect(page).to have_text("When we ask you for information, we will keep to the law.")
    end

    scenario "Disclaimer section" do
      click_link "Disclaimer"
      expect(page).to have_xpath(".//h2[contains(.,'Disclaimer')]")
      expect(page).to have_text("While we make every effort to keep information up to date, we don’t provide any guarantees, conditions or warranties that it will be:")
    end
  end
end
