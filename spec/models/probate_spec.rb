require 'rails_helper'

RSpec.describe Probate, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'kase' do
      context 'when true' do
        before { subject.kase = true }

        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.kase = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.kase = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
