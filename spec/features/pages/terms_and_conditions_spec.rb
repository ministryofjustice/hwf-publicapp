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

    scenario "Disclaimer section" do
      click_link "Disclaimer"
      expect(page).to have_xpath(".//h2[contains(.,'Disclaimer')]")
      expect(page).to have_text("While we make every effort to keep information up to date, we don’t provide any guarantees, conditions or warranties that it will be:")
    end
  end
end
