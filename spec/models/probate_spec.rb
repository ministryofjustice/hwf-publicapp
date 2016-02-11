require 'rails_helper'

RSpec.describe Probate, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'probate_case' do
      context 'when true' do
        before { subject.probate_case = true }

        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.probate_case = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.probate_case = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
