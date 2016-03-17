require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do

  describe 'POST #create' do
    let(:session) { double(:[]= => true) }
    let(:online_application) { double }
    let(:builder) { double(online_application: online_application) }
    let(:service) { double }

    before do
      allow(controller).to receive(:session).and_return(session)
      allow(OnlineApplicationBuilder).to receive(:new).with(session).and_return(builder)
      allow(SubmitApplication).to receive(:new).and_return(service)
      allow(service).to receive(:post).with(online_application).and_return(response)

      post :create
    end

    context 'on a successful response' do
      let(:response) { { result: true, message: 'HWF-00000' } }

      it 'stores the result on the session' do
        expect(session).to have_received(:[]=).with(:submission_response, response)
      end

      it 'redirects to the show action' do
        expect(response).to redirect_to(submission_path)
      end
    end

    context 'on a failed response' do
      let(:response) { { result: false, message: 'Failed' } }

      it 'stores the result on the session' do
        expect(session).to have_received(:[]=).with(:submission_response, response)
      end

      it 'redirects to the confirmation page' do
        expect(response).to redirect_to(summary_path)
      end
    end
  end

  describe 'GET #show' do
    before do
      allow(controller).to receive(:reset_session)

      get :show
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns the response object' do
      expect(assigns(:response)).to eql(result: true, message: 'HWF-16-1234')
    end

    it 'clears the session' do
      expect(controller).to have_received(:reset_session)
    end
  end
end
