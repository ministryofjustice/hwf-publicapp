module ApplicationHelper
  def ni_number_value(summary)
    summary.ni_number.blank? ? t('ni_number_no', scope: 'summary.labels') : summary.ni_number
  end

  def cookies_accepted?
    Forms::Cookie::SettingForm.new(request: request).accepted?
  end

  def show_cookie_banner?
    !Forms::Cookie::SettingForm.new(request: request).preference_set?
  end

end
