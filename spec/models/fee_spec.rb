require 'rails_helper'

RSpec.describe Fee, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'paid' do
      context 'when true' do
        before { subject.paid = true }

        context 'and date_paid is completed' do
          before { subject.date_paid = Time.zone.yesterday }

          it { expect(subject.valid?).to be true }
        end

        context 'and date_paid is not completed' do
          before { subject.date_paid = nil }

          it { expect(subject.valid?).to be false }
        end
      end

      context 'when false' do
        before { subject.paid = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.paid = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
