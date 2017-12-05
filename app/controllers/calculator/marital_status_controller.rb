module Calculator
  class MaritalStatusController < ::ApplicationController
    def edit
      @form = Forms::Calculator::MaritalStatus.new
    end

    def update
      @form = Forms::Calculator::MaritalStatus.new(calculation_params.to_h)
      if @form.valid?
        SubmitCalculation.call(@form.export)
      else
        render :new
      end
    end

    private

    def calculation_params
      params.require(:calculation).permit(:marital_status)
    end
  end
end