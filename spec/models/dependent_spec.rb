require 'rails_helper'

RSpec.describe Dependent, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'children' do
      context 'when true' do
        before { subject.children = true }

        it { expect(subject.valid?).to be true }
      end

      context 'when false' do
        before { subject.children = false }

        it { expect(subject.valid?).to be true }
      end

      context 'when not a boolean value' do
        before { subject.children = 'string' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
