class StepElevenPage < BasePage
  elements :block_label, '.block-label'
  element :probate_case_false, '#probate_kase_false'
  element :probate_case_true, '#probate_kase_true'
  element :probate_deceased_name, '#probate_deceased_name'
  element :probate_date_of_death, '#probate_date_of_death'
  elements :error_message, '.error-message'

  def load_page(page_version = nil)
    load(v: page_version)
  end
end
