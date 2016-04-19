require 'rails_helper'

RSpec.describe SummariesController, type: :controller do

  describe 'GET #show' do
    let(:session) { double }
    let(:summary_view) { double }

    before do
      allow(controller).to receive(:session).and_return(session)
      allow(Views::Summary).to receive(:new).with(session).and_return(summary_view)

      get :show
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'assigns the summary view model' do
      expect(assigns(:summary)).to eql(summary_view)
    end
  end
end
