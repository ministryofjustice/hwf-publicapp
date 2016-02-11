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

    context 'when paramters are invalid' do
      it 'goes back to the form' do
        post :marital_status_save, marital_status: { married: 'foo' }
        expect(response).to redirect_to(:marital_status)
      end
    end
  end

  describe 'GET #savings_and_investments' do
    it 'returns http success' do
      get :savings_and_investment
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #savings_and_investments_save' do
    context 'when parameters are valid' do
      it 'redirects to the next page' do
        post :savings_and_investment_save, savings_and_investment: { less_than_limit: 'true' }
        expect(response).to redirect_to(summary_path)
      end
    end

    context 'when paramters are invalid' do
      it 'goes back to the form' do
        post :savings_and_investment_save, savings_and_investment: { less_than_limit: 'foo' }
        expect(response).to redirect_to(:savings_and_investment)
      end
    end
  end

  describe 'GET #summary' do
    it 'returns http success' do
      get :summary
      expect(response).to have_http_status(:success)
    end
  end

end
