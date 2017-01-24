require 'rails_helper'

RSpec.describe HealthStatus::PingController, type: :controller do

  describe 'GET #show' do
    let(:json) { { some_key: 'some value' } }
    let(:deployment) { double(as_json: json) }

    before do
      allow(HealthStatus::Deployment).to receive(:new).and_return(deployment)

      get :show
    end

    it 'returns success code' do
      expect(response).to have_http_status(:success)
    end

    it 'returns JSON content type' do
      expect(response.content_type).to eq('application/json')
    end

    it 'returns the deployment json in the body' do
      expect(response.body).to eql(json.to_json)
    end
  end
end
