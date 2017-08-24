class SaucelabsPage < BasePage
  element :no_income, '.income_kind_applicant_13'
  section :income_sources, '.income-sources' do
    elements :block_label, '.block-label'
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
