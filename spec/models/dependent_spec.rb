require 'rails_helper'

RSpec.describe Dependent, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'children' do
      context 'when true' do
        before do
          subject.children = true
          subject.children_number = '4'
        end

        it { expect(subject.valid?).to be true }

        context 'and children_number is not supplied' do
          before { subject.children_number = '' }

          it { expect(subject.valid?).to be false }
        end

        context 'and children_number is supplied as a word' do
          before { subject.children_number = 'three' }

          it { expect(subject.valid?).to be false }
        end
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

  describe '#export' do
    let(:children_number) { 3 }

    subject { described_class.new(children: children, children_number: children_number).export }

    context 'when children is true' do
      let(:children) { true }

      it 'returns hash with children parameter containing children_number' do
        is_expected.to eql(children: children_number)
      end
    end

    context 'when children is false' do
      let(:children) { false }

      it 'returns hash with children parameter containing 0' do
        is_expected.to eql(children: 0)
      end
    end
  end
end
