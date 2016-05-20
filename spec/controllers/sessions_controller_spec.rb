require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #start' do
    let(:storage) { double(start: nil) }

    before do
      allow(controller).to receive(:storage).and_return(storage)

      get :start
    end

    it 'starts the storage' do
      expect(storage).to have_received(:start)
    end

    it 'redirects to the form_name question' do
      expect(response).to redirect_to(question_path(:form_name))
    end
  end

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
