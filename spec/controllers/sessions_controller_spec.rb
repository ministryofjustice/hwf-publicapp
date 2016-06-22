require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:session) { double }
  let(:storage) { double(start: nil) }

  before do
    allow(controller).to receive(:session).and_return(session)
    expect(Storage).to receive(:new).with(session, clear: true).and_return(storage)
  end

  describe 'GET #start' do
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
    before do
      delete :destroy
    end

    it 'redirects to the start page' do
      expect(response).to redirect_to(root_path)
    end
  end
end
