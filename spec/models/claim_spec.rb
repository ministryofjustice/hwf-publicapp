require 'rails_helper'

RSpec.describe Claim, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'number' do
      context 'when true' do
        before do
          subject.number = true
          subject.identifier = 'formy-form'
        end

        describe 'identifier' do
          context 'when not provided' do
            before { subject.identifier = '' }

            it { expect(subject.valid?).to be false }
          end

          context 'when provided' do
            it { expect(subject.valid?).to be true }
          end
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
end
