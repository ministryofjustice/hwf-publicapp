module IncomeHelper
  def i18n_status_refund_suffix
    ''.tap do |suffix|
      suffix << (@online_application.married? ? '_married' : '_single')
      suffix << '_refund' if @online_application.refund?
    end
  end

  def kinds_alternative_translation(kind)
    return kind if kind != I18n.t('1', scope: ['questions.income_kind.kinds'])

    I18n.t('wages', scope: ['questions.income_range'])
  end
end
