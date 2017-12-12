module Calculator
  class CalculationController < ::ApplicationController
    FORM_CLASSES = {
        nil => Forms::Calculator::Nil,
        marital_status: Forms::Calculator::MaritalStatus,
        fee: Forms::Calculator::Fee
    }


    def home
      @form = form_class.new
      session[:calculator_inputs] = {}
    end

    def edit
      @form = form_class.new
    end

    def update
      @form = form_class.new(calculation_params.to_h)
      if @form.valid?
        session[:calculator_inputs].merge!(@form.export)
        submit_service.call(session[:calculator_inputs])
        handle_calculation
      else
        render :new
      end
    end

    private

    def handle_calculation
      redirect_to edit_calculator_calculation_url(form: submit_service.response.fields_required.first)
    end

    def form_class
      klass = FORM_CLASSES[params[:form].try(:to_sym)]
      raise "Unknown form class for '#{params[:form]}'" if klass.nil?
      klass
    end

    def calculation_params
      params.require(:calculation).permit(:marital_status, :fee)
    end

    def submit_service
      @submit_service ||= SubmitCalculation.new(Settings.submission.url, Settings.submission.token)
    end
  end
end