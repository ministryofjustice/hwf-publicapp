require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    allow(controller).to receive(:storage).and_return(storage)
  end

  describe 'GET #start' do
    let(:storage) { double(start: nil) }

    before do
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
    let(:storage) { double(clear: nil) }

    before do
      delete :destroy
    end

    it 'clears the storage' do
      expect(storage).to have_received(:clear)
    end

    it 'redirects to the start page' do
      expect(response).to redirect_to(root_path)
    end
  end
end
