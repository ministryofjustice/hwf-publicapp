require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject { described_class.new }

  describe 'validations' do
    before do
      subject.email_option = true
      subject.email = 'foo@bar.com'
    end

    describe 'email_option' do
      context 'when true' do
        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.email_option = false }

        it { expect(subject.valid?).to be true }
      end

      describe 'email' do
        context 'when email_option is true' do
          context 'and email is given' do
            it { expect(subject.valid?).to be true }
          end

          context 'and email is not given' do
            before { subject.email = '' }

            it { expect(subject.valid?).to be false }
          end
        end
      end
    end
  end
end
