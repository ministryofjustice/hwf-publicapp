module Views
  class QuestionTitle
    def initialize(form, online_application)
      @form = form
      @online_application = online_application
    end

    def i18n_title
      if @form.id == 'savings_and_investment_extra'
        if @online_application.married?
          'text_married'
        else
          'text_single'
        end
      else
        'text'
      end
    end
  end
end
