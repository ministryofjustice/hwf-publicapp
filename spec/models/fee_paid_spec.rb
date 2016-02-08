require 'rails_helper'

RSpec.describe FeePaid, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'answer' do
      context 'when true' do
        before { subject.answer = true }

        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.answer = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.answer = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
