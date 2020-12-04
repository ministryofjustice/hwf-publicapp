class SaucelabsPage < BasePage
  element :no_income, '.income_kind_applicant_13'
  section :income_sources, '.income-sources' do
    elements :block_label, 'label'
  end
end
