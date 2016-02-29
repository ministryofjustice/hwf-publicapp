require 'rails_helper'

RSpec.describe FormName, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'identifier' do
      context 'when provided' do
        before { subject.identifier = 'N1' }

        it { expect(subject.valid?).to be true }
      end

      context 'when not provided' do
        before { subject.identifier = '' }

        it { expect(subject.valid?).to be true }
      end
    end
  end
end
