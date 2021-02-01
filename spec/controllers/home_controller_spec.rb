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

  describe '#checklist' do
    it 'returns http success' do
      get :checklist
      expect(response).to have_http_status(:success)
    end
  end

  describe '#accessibility_statement' do
    it 'returns http success' do
      get :accessibility_statement
      expect(response).to have_http_status(:success)
    end
  end

  describe '#privacy_policy' do
    it 'returns http success' do
      get :privacy_policy
      expect(response).to have_http_status(:success)
    end
  end
end
