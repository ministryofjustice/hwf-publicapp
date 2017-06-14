class StepFifteenPage < BasePage
  element :title, '#personal_detail_title'
  element :first_name, '#personal_detail_first_name'
  element :last_name, '#personal_detail_last_name'
  sections :form_group, '.form-group' do
    element :form_label, 'form-label'
    element :hint, '.hint'
  end

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
