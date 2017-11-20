class StepFifteenPage < BasePage
  element :title, '#personal_detail_title'
  element :first_name, '#personal_detail_first_name'
  element :last_name, '#personal_detail_last_name'
  elements :form_group, '.form-group'
  element :hint, '.hint'
end
