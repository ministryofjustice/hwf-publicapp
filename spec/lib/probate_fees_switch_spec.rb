RSpec.describe ProbateFeesSwitch do
  subject { described_class }

  describe '#use_probate_fees_changes?' do
    subject do
      Timecop.freeze(current_time) do
        described_class.use_probate_fees_changes?
      end
    end

    context 'when called after the set date' do
      let(:current_time) { probate_fees_release_date }

      it { is_expected.to be true }
    end

    context 'when called before the set date' do
      let(:current_time) { probate_fees_release_date - 1.day }

      it { is_expected.to be false }
    end
  end
end
