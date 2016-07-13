module Views
  class QuestionTitle
    def initialize(form, online_application)
      @form = form
      @online_application = online_application
    end

    def i18n_title
      'text'.tap do |i18n|
        if %w[benefit income].include?(@form.id)
          i18n << '_refund' if @online_application.refund?
        elsif status_questions.include?(@form.id)
          i18n << (@online_application.married? ? '_married' : '_single')
        end
      end
    end

    private

    def status_questions
      %w[savings_and_investment_extra income_kind income_range income_amount]
    end
  end
end
