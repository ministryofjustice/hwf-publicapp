require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:session) { double }
  let(:storage_empty) { false }
  let(:storage) { double(load_form: nil, save_form: nil, empty?: storage_empty) }
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
    let(:question_position) { 0 }

    before do
      allow(QuestionFormFactory).to receive(:position).with(id).and_return(question_position)

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

      include_examples 'cache suppress headers'

      context 'when the storage is empty' do
        let(:storage_empty) { true }

        context 'when the question is the first question' do
          it 'does not redirect to the home page' do
            expect(response).to have_http_status(200)
          end
        end
        context 'when the question is not the first question' do
          let(:question_position) { 1 }

          it 'redirects to the home page' do
            expect(response).to redirect_to(root_path)
          end
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

  describe '#married?' do
    before do
      allow(controller).to receive(:session).and_return(session)
    end

    subject { controller.married? }

    context 'when the session has "marital_status" value set' do
      context 'when it\'s empty' do
        let(:session) { { 'marital_status' => {} } }

        it { is_expected.to be nil }
      end

      context 'when it has a hash with "married" field' do
        let(:session) { { 'marital_status' => { 'married' => married } } }

        context 'when "married" is true' do
          let(:married) { true }

          it { is_expected.to be true }
        end
        context 'when "married" is false' do
          let(:married) { false }

          it { is_expected.to be false }
        end
      end
    end

    context 'when the session does not have "marital_status" value set' do
      let(:session) { {} }

      it { is_expected.to be nil }
    end
  end
end
