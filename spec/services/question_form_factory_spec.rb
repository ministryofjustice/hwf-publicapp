require 'rails_helper'

RSpec.describe QuestionFormFactory do
  describe '.position' do
    let(:id) { :benefit }
    subject { described_class.position(id) }

    it 'returns the position of the given question' do
      is_expected.to eql(5)
    end
  end

  describe '.get_form' do
    let(:online_application) { build(:online_application) }

    subject { described_class.get_form(id, online_application) }

    context 'claim question' do
      let(:id) { :claim }

      context 'when the online_application is an ET one' do
        let(:online_application) { build(:online_application, :et) }

        it { is_expected.to be_a(Forms::Claim::Et) }
      end

      context 'when the online_application is not an ET one' do
        it { is_expected.to be_a(Forms::Claim::Default) }
      end
    end

    context 'for other existing question' do
      let(:id) { :marital_status }

      it 'returns an instance of the form' do
        is_expected.to be_a(Forms::MaritalStatus)
      end
    end

    context 'for a question that does not exist' do
      let(:id) { :wrong }

      it 'raises QuestionDoesNotExist error' do
        expect { subject }.to raise_error(QuestionFormFactory::QuestionDoesNotExist)
      end
    end
  end
end
