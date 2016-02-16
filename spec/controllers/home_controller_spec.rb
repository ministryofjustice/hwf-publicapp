require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #marital_status' do
    it 'returns http success' do
      get :marital_status
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #marital_status_save' do
    let(:next_step) { Navigation.new.steps[:marital_status] }
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :marital_status_save, marital_status: { married: 'true' }
        expect(response).to redirect_to(next_step)
      end
    end

    context 'when parameters are invalid' do
      it 'goes back to the form' do
        post :marital_status_save, marital_status: { married: 'foo' }
        expect(response).to redirect_to(:marital_status)
      end
    end
  end

  describe 'GET #savings_and_investment' do
    it 'returns http success' do
      get :savings_and_investment
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #savings_and_investment_save' do
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :savings_and_investment_save, savings_and_investment: { less_than_limit: 'true' }
        expect(response).to redirect_to(benefit_path)
      end
    end

    context 'when parameters are invalid' do
      it 'goes back to the form' do
        post :savings_and_investment_save, savings_and_investment: { less_than_limit: 'foo' }
        expect(response).to redirect_to(:savings_and_investment)
      end
    end
  end

  describe 'GET #benefit' do
    it 'returns http success' do
      get :benefit
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #benefit_save' do
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :benefit_save, benefit: { on_benefits: 'true' }
        expect(response).to redirect_to(:fee)
      end
    end

    context 'when paramters are invalid' do
      it 'goes back to the form' do
        post :benefit_save, benefit: { on_benefits: 'foo' }
        expect(response).to redirect_to(:benefit)
      end
    end
  end

  describe 'GET #fee' do
    it 'returns http success' do
      get :fee
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #fee_save' do
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :fee_save, fee: { paid: 'true' }
        expect(response).to redirect_to(:probate)
      end
    end

    context 'when parameters are invalid' do
      it 'goes back to the form' do
        post :fee_save, fee: { paid: 'foo' }
        expect(response).to redirect_to(:fee)
      end
    end
  end

  describe 'GET #probate' do
    it 'returns http success' do
      get :probate
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #probate_save' do
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :probate_save, probate: { kase: 'true' }
        expect(response).to redirect_to(:claim)
      end
    end

    context 'when parameters are invalid' do
      it 'goes back to the form' do
        post :probate_save, probate: { kase: 'foo' }
        expect(response).to redirect_to(:probate)
      end
    end
  end

  describe 'GET #claim' do
    it 'returns http success' do
      get :claim
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #claim_save' do
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :claim_save, claim: { number: 'true' }
        expect(response).to redirect_to(:form_name)
      end
    end

    context 'when parameters are invalid' do
      it 'goes back to the form' do
        post :claim_save, claim: { number: 'foo' }
        expect(response).to redirect_to(:claim)
      end
    end
  end

  describe 'GET #form_name' do
    it 'returns http success' do
      get :form_name
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #form_name_save' do
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :form_name_save, form_name: { identifier: 'N1' }
        expect(response).to redirect_to(:national_insurance)
      end
    end

    context 'when parameters are invalid' do
      it 'goes back to the form' do
        post :form_name_save, form_name: { number: nil }
        expect(response).to redirect_to(:form_name)
      end
    end
  end

  describe 'GET #national_insurance' do
    it 'returns http success' do
      get :claim
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #national_insurance_save' do
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :national_insurance_save, national_insurance: { number: 'AB123456A' }
        expect(response).to redirect_to(:personal_detail)
      end
    end

    context 'when parameters are invalid' do
      it 'goes back to the form' do
        post :national_insurance_save, national_insurance: { number: 'foo' }
        expect(response).to redirect_to(:national_insurance)
      end
    end
  end

  describe 'GET #personal_details' do
    it 'returns http success' do
      get :personal_detail
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #personal_detail_save' do
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :personal_detail_save, personal_detail: { title: 'Lord', first_name: 'Bob', last_name: 'Foo' }
        expect(response).to redirect_to(:summary)
      end
    end

    context 'when parameters are invalid' do
      it 'goes back to the form' do
        post :personal_detail_save, personal_detail: { random: 'foo' }
        expect(response).to redirect_to(:personal_detail)
      end
    end
  end

  describe 'GET #address' do
    it 'returns http success' do
      get :applicant_address
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #summary' do
    it 'returns http success' do
      get :summary
      expect(response).to have_http_status(:success)
    end
  end
end
