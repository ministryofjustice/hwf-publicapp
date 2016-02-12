require 'rails_helper'

RSpec.describe Claim, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'number' do
      context 'when true' do
        before { subject.number = true }

        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.number = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.number = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
