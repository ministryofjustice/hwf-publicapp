require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do
  let(:session) { double }
  let(:storage) { double }
  let(:online_application) { double }
  let(:builder) { double(online_application: online_application) }

  before do
    allow(controller).to receive(:session).and_return(session)
    allow(Storage).to receive(:new).with(session).and_return(storage)
    allow(OnlineApplicationBuilder).to receive(:new).with(storage).and_return(builder)
  end

  describe 'POST #create' do
    let(:service) { double }

    before do
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

      it 'sets an flash error message' do
        expect(flash[:error]).to eql('We couldn\'t process your application at this time. Please try again later.')
      end
    end
  end

  describe 'GET #show' do
    let(:result) { { result: true, message: 'HWF-010101' } }
    let(:storage) { double(submission_result: result, time_taken: 600) }

    before do
      allow(controller).to receive(:reset_session)
      allow(online_application).to receive(:benefits).and_return(true)

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

    it 'assigns the online application model' do
      expect(assigns(:online_application)).to eql(online_application)
    end
  end
end
