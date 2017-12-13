require 'rails_helper'
module MojHwf
  module Calculator
    RSpec.describe CalculationController, type: :controller do

      describe 'GET #edit' do
        it 'returns http success' do
          get :edit
          expect(response).to have_http_status(:success)
        end

        it 'renders a nil form if no form is provided'
        it 'renders a defined form if specified'
      end

      describe 'PATCH #update' do
        it 'has not been written yet' do
          boom!
        end
      end

    end
  end
end
