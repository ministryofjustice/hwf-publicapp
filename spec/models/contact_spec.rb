require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject do
    described_class.new(email: 'foo@bar.com',
                        feedback_opt_in: true)
  end

  describe 'validations' do
    describe 'email' do
      context 'and valid email is given' do
        it { expect(subject.valid?).to be true }
      end

      context 'and invalid email is given' do
        before { subject.email = 'foobar.com' }

        it { expect(subject.valid?).to be false }
      end

      context 'and email is not given' do
        before { subject.email = '' }

        it { expect(subject.valid?).to be true }
      end
    end

    describe 'feedback_opt_in' do
      context 'when true' do
        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.feedback_opt_in = false }

        it { expect(subject.valid?).to be true }
      end
    end
  end

  describe '#export' do
    let(:email) { 'some@email.domain' }
    let(:feedback_opt_in) { true }

    subject { described_class.new(email: email, feedback_opt_in: feedback_opt_in).export }

    context 'when email is set' do
      it 'the returned hash includes email_contact true and email_address' do
        is_expected.to include(email_contact: true, email_address: email)
      end
    end

    context 'when email is not set' do
      let(:email) { nil }

      it 'the returned hash includes email_contact false and email_address is nil' do
        is_expected.to include(email_contact: false, email_address: email)
      end
    end

    it 'the returned hash always returns phone_contact as false' do
      is_expected.to include(phone_contact: false)
    end

    it 'the returned hash includesreturns post_contact as false' do
      is_expected.to include(post_contact: false)
    end

    context 'when feedback_opt_in is true' do
      it 'the returned hash includes feedback_opt_in true' do
        is_expected.to include(feedback_opt_in: true)
      end
    end

    context 'when feedback_opt_in is false' do
      let(:feedback_opt_in) { false }

      it 'the returned hash includes feedback_opt_in false' do
        is_expected.to include(feedback_opt_in: false)
      end
    end
  end

end
