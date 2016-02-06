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
    it 'redirects' do
      post :marital_status_save, { marital_status: { married: 'true' } }
      expect(response).to redirect_to(summary_path)
    end
  end

  describe 'GET #summary' do
    it 'returns http success' do
      get :summary
      expect(response).to have_http_status(:success)
    end
  end

end
