require 'rails_helper'

RSpec.describe ClearDownstreamQuestions do
  subject(:service) { described_class.new(storage, question) }

  describe '#for_changes' do
    let(:storage) { double(clear_form: nil) }

    before do
      service.for_changes(old_online_application, new_online_application)
    end

    context 'when the question is "dependent"' do
      let(:question) { :dependent }
      let(:old_online_application) { build :online_application, children: 2 }

      context 'when the amount of children has changed' do
        let(:new_online_application) { build :online_application, children: 1 }

        it 'clears income_range and income_amount questions' do
          expect(storage).to have_received(:clear_form).with(:income_range)
          expect(storage).to have_received(:clear_form).with(:income_amount)
        end
      end

      context 'when the amount of children has not changed' do
        let(:new_online_application) { build :online_application, children: 2 }

        it 'does not clear any questions' do
          expect(storage).not_to have_received(:clear_form)
        end
      end
    end

    context 'when the question is "income_kind"' do
      let(:question) { :income_kind }
      let(:old_online_application) { build :online_application, income: 1400 }

      context 'when the income has changed to 0' do
        let(:new_online_application) { build :online_application, income: 0 }

        it 'clears income_range and income_amount questions' do
          expect(storage).to have_received(:clear_form).with(:income_range)
          expect(storage).to have_received(:clear_form).with(:income_amount)
        end
      end

      context 'when the income has not changed' do
        let(:new_online_application) { build :online_application, income: 1400 }

        it 'does not clear any questions' do
          expect(storage).not_to have_received(:clear_form)
        end
      end
    end

    context 'when the question is "income_range"' do
      let(:question) { :income_range }
      let(:old_online_application) { build :online_application, :income_between_thresholds }

      context 'when the range has changed' do
        let(:new_online_application) { build :online_application, :income_below_thresholds }

        it 'clears income_amount questions' do
          expect(storage).to have_received(:clear_form).with(:income_amount)
        end
      end
    end
  end
end
