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

  describe '#export' do
    subject { described_class.new(on_benefits: on_benefits).export }

    context 'when on_benefits is true' do
      let(:on_benefits) { true }

      it 'returns hash with benefits parameter true' do
        is_expected.to eql(benefits: true)
      end
    end

    context 'when on_benefits is false' do
      let(:on_benefits) { false }

      it 'returns hash with on_benefits parameter true' do
        is_expected.to eql(benefits: false)
      end
    end
  end

end
