require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'DELETE #destroy' do
    before do
      allow(controller).to receive(:reset_session)

      delete :destroy
    end

    it 'clears the session' do
      expect(controller).to have_received(:reset_session)
    end

    it 'redirects to the start page' do
      expect(response).to redirect_to(root_path)
    end
  end
end
