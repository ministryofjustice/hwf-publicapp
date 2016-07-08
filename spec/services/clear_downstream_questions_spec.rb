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

        it 'does not clears income_range and income_amount questions' do
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
  end
end
