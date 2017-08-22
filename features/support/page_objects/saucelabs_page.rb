class CommonPage < BasePage
    element :no_income, '.income_kind_applicant_13'
    
    def load_page(page_version = nil)
    load(v: page_version)
  end
end
