require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:session) { double }
  let(:storage) { double(start: nil, clear: nil) }

  before do
    allow(controller).to receive(:session).and_return(session)
  end

  describe 'GET #start' do
    before do
      expect(Storage).to receive(:new).with(session, clear: true).and_return(storage)

      get :start
    end

    it 'starts the storage' do
      expect(storage).to have_received(:start)
    end

    it 'redirects to the form_name question' do
      expect(response).to redirect_to(question_path(:form_name))
    end
  end

  describe 'POST #finish' do
    let(:external_url) { nil }
    let(:done_page_settings) { double(external_url: external_url) }

    before do
      allow(Settings).to receive(:done_page).and_return(done_page_settings)
      expect(Storage).to receive(:new).with(session).and_return(storage)

      post :finish
    end

    it 'clears the storage' do
      expect(storage).to have_received(:clear)
    end

    context 'when the done page external url is set' do
      let(:external_url) { 'http://som.e.t.h.i.ng' }

      it 'redirects to the external page' do
        expect(response).to redirect_to(external_url)
      end
    end

    context 'when no done page external url is set' do
      it 'redirects to the homepage' do
        expect(response).to redirect_to(root_path)
      end
    end

  end

  describe 'DELETE #destroy' do
    before do
      expect(Storage).to receive(:new).with(session, clear: true).and_return(storage)

      delete :destroy
    end

    it 'redirects to the start page' do
      expect(response).to redirect_to(root_path)
    end
  end
end
