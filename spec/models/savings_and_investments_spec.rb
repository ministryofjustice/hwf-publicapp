require 'rails_helper'

RSpec.describe SavingsAndInvestments, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'less_than_limit' do
      context 'when true' do
        before { subject.less_than_limit = true }

        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.less_than_limit = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.less_than_limit = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
