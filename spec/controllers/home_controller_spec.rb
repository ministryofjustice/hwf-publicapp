require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#terms_and_conditions' do
    it 'returns http success' do
      get :terms_and_conditions
      expect(response).to have_http_status(:success)
    end
  end
end
