require 'rails_helper'

RSpec.describe Benefit, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'on_benefits' do
      context 'when true' do
        before { subject.on_benefits = true }

        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.on_benefits = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.on_benefits = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
