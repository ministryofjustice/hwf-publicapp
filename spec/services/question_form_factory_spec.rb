require 'rails_helper'

RSpec.describe QuestionFormFactory do
  describe '.position' do
    let(:id) { :benefit }
    subject { described_class.position(id) }

    it 'returns the position of the given question' do
      is_expected.to eql(2)
    end
  end

  describe '.get_form' do
    subject { described_class.get_form(id) }

    context 'for an existing form' do
      let(:id) { :marital_status }

      it 'returns an instance of the form' do
        is_expected.to be_a(Forms::MaritalStatus)
      end
    end

    context 'for a form that does not exist' do
      let(:id) { :wrong }

      it 'raises QuestionDoesNotExist error' do
        expect { subject }.to raise_error(QuestionFormFactory::QuestionDoesNotExist)
      end
    end
  end
end
