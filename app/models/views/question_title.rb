module Views
  class QuestionTitle
    def initialize(form, online_application)
      @form = form
      @online_application = online_application
    end

    def i18n_title
      'text'.tap do |i18n|
        if %w[savings_and_investment benefit income].include?(@form.id)
          i18n << '_refund' if @online_application.refund?
        elsif @form.id == 'savings_and_investment_extra'
          i18n << (@online_application.married? ? '_married' : '_single')
        end
      end
    end
  end
end
