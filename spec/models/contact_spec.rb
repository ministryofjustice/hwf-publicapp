require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject do
    described_class.new(email_option: true,
                        email: 'foo@bar.com',
                        phone_option: true,
                        phone: '078 112 123 22',
                        post_option: true)
  end

  describe 'validations' do
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

    describe 'phone_option' do
      context 'when true' do
        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.phone_option = false }

        it { expect(subject.valid?).to be true }
      end

      describe 'phone' do
        context 'when phone_option is true' do
          context 'and phone is given' do
            it { expect(subject.valid?).to be true }
          end

          context 'and phone is not given' do
            before { subject.phone = '' }

            it { expect(subject.valid?).to be false }
          end
        end
      end
    end

    describe 'post_option' do
      context 'when true' do
        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.post_option = false }

        it { expect(subject.valid?).to be true }
      end
    end

    describe 'when no option is picked' do
      # TODO: discuss this
      before do
        subject.email_option = false
        subject.phone_option = false
        subject.post_option = false
      end
    end
  end
end
