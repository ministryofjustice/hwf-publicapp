require 'rails_helper'

RSpec.describe Forms::HomeOffice, type: :model do
  subject(:form_ho) { described_class.new }

  describe 'validations' do
    describe 'mandatory if no NI number' do
      context 'preformat the ho' do
        before {
          form_ho.ho_number = ' L 123 45 6'
          form_ho.valid?
        }

        it { expect(form_ho.ho_number).to eql('L123456') }
      end

      context 'when NI not provided' do
        before { form_ho.ho_number = 'L123456' }

        it { expect(form_ho.valid?).to be true }

        describe 'format for single applicant' do
          context 'invalid only numbers' do
            before { form_ho.ho_number = '1234567' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'invalid only letters' do
            before { form_ho.ho_number = 'ABCDEFG' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'invalid too short' do
            before { form_ho.ho_number = 'L12345' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'invalid letter not at the begining' do
            before { form_ho.ho_number = '12L345' }

            it { expect(form_ho.valid?).to be false }
          end
        end

        describe 'format for multiple applicants' do
          context 'invalid only numbers' do
            before { form_ho.ho_number = '1234567/1' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'invalid only letters' do
            before { form_ho.ho_number = 'ABCDEFG/1' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'invalid too short' do
            before { form_ho.ho_number = 'L12345/1' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'invalid letter not at the begining' do
            before { form_ho.ho_number = '12L345/1' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'invalid no number after slash' do
            before { form_ho.ho_number = 'L123456/' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'invalid number and letters after slash' do
            before { form_ho.ho_number = 'L123456/1a' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'invalid letters after slash' do
            before { form_ho.ho_number = 'L123456/a' }

            it { expect(form_ho.valid?).to be false }
          end

          context 'valid numbers only after slash' do
            before { form_ho.ho_number = 'L123456/20' }

            it { expect(form_ho.valid?).to be true }
          end
        end
      end

      context 'when NI and HO are empty' do
        before {
          form_ho.ho_number = ''
          form_ho.ni_number_present = false
        }

        it { expect(form_ho.valid?).to be false }
      end

      context 'when NI is present' do
        before {
          form_ho.ho_number = ''
          form_ho.ni_number_present = true
        }

        it { expect(form_ho.valid?).to be true }
      end

      context 'when NI number present is nil' do
        before {
          form_ho.ho_number = ''
          form_ho.ni_number_present = nil
        }

        it { expect(form_ho.valid?).to be false }
      end
    end
  end

  describe '#export' do
    subject { described_class.new(ho_number: ho_number).export }

    let(:ho_number) { 'AA123456A' }

    it 'returns hash with ho_number set' do
      expect(subject).to eql(ho_number: ho_number)
    end
  end

end
