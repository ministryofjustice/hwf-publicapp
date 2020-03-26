module ApplicationHelper
  def ni_number_value(summary)
    summary.ni_number.blank? ? t('ni_number_no', scope: 'summary.labels') : summary.ni_number
  end
end
