require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:session) { double }
  let(:storage) { double(load_form: nil, save_form: nil) }
  let(:valid_id) { :question }
  let(:invalid_id) { :invalid }
  let(:form) { double }

  before do
    allow(QuestionFormFactory).to receive(:get_form).with(valid_id).and_return(form)
    allow(QuestionFormFactory).to receive(:get_form).with(invalid_id).and_raise(QuestionFormFactory::QuestionDoesNotExist)
    allow(controller).to receive(:session).and_return(session)
    allow(Storage).to receive(:new).with(session).and_return(storage)
  end

  describe 'GET #edit' do
    before do
      get :edit, id: id
    end

    context 'when the question is a valid one' do
      let(:id) { valid_id }

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end

      it 'assigns the form' do
        expect(assigns(:form)).to eql(form)
      end

      it 'loads the form from the storage' do
        expect(storage).to have_received(:load_form).with(form)
      end
    end

    context 'when the question is invalid' do
      let(:id) { invalid_id }

      it 'responds with 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'PUT #update' do
    let(:valid?) { false }
    let(:params) { { question_1: 'AAA', question_2: 'BBB' } }
    let(:form) { double(id: id, permitted_attributes: params.keys, update_attributes: nil, valid?: valid?) }
    let(:next_path) { root_path }
    let(:navigation) { double(next: next_path) }

    before do
      allow(Navigation).to receive(:new).with(id).and_return(navigation)

      put :update, id: id, id => params
    end

    context 'when the question is a valid one' do
      let(:id) { valid_id }

      it 'updates the form with the posted params' do
        expect(form).to have_received(:update_attributes).with(params)
      end

      context 'when the form is valid' do
        let(:valid?) { true }

        it 'stores the form in the storage' do
          expect(storage).to have_received(:save_form).with(form)
        end

        it 'redirects to the next question based on the Navigation object' do
          expect(response).to redirect_to(next_path)
        end
      end

      context 'when the form is invalid' do
        it 'renders the edit template' do
          expect(response).to render_template(:edit)
        end

        it 'assigns the form' do
          expect(assigns(:form)).to eql(form)
        end
      end
    end

    context 'when the question is invalid' do
      let(:id) { invalid_id }

      it 'responds with 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
