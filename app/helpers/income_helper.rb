module IncomeHelper
  def i18n_status_refund_suffix
    ''.tap do |suffix|
      suffix << (@online_application.married? ? '_married' : '_single')
      suffix << '_refund' if @online_application.refund?
    end
  end
end
