module Calculator
  class MaritalStatusController < ::ApplicationController
    def edit
      @form = Forms::MaritalStatus.new
    end
  end
end