require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do

  describe 'POST #create' do
    before do
      post :create
    end

    it 'redirects to the show action' do
      expect(response).to redirect_to(submission_path)
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
