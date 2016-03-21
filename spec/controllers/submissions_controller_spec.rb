require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do
  let(:session) { double }
  let(:storage) { double }

  before do
    allow(controller).to receive(:session).and_return(session)
    allow(Storage).to receive(:new).with(session).and_return(storage)
  end

  describe 'POST #create' do
    let(:online_application) { double }
    let(:builder) { double(online_application: online_application) }
    let(:service) { double }

    before do
      allow(OnlineApplicationBuilder).to receive(:new).with(storage).and_return(builder)
      allow(SubmitApplication).to receive(:new).and_return(service)
      allow(service).to receive(:post).with(online_application).and_return(response)
      allow(storage).to receive(:submission_result=)

      post :create
    end

    context 'on a successful response' do
      let(:response) { { result: true, message: 'HWF-000-000' } }

      it 'stores the result on the session' do
        expect(storage).to have_received(:submission_result=).with(response)
      end

      it 'redirects to the show action' do
        expect(response).to redirect_to(submission_path)
      end
    end

    context 'on a failed response' do
      let(:response) { { result: false, message: 'Failed' } }

      it 'stores the result on the session' do
        expect(storage).to have_received(:submission_result=).with(response)
      end

      it 'redirects to the summary page' do
        expect(response).to redirect_to(summary_path)
      end
    end
  end

  describe 'GET #show' do
    let(:result) { { result: true, message: 'HWF-010101' } }
    let(:storage) { double(submission_result: result) }

    before do
      allow(controller).to receive(:reset_session)

      get :show
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns the response object from the session' do
      expect(assigns(:result)).to eql(result)
    end

    it 'clears the session' do
      expect(controller).to have_received(:reset_session)
    end
  end
end
