require 'rails_helper'

RSpec.describe Income, type: :model do
  subject { described_class.new }

  describe 'validations' do
    describe 'other_description' do
      context 'when no other income recorded' do

        it { expect(subject.valid?).to be true }
      end

      context 'when other income recorded' do
        before { subject.other = 100.0 }

        it { expect(subject.valid?).to be false }
      end

      context 'when partners other income recorded' do
        before { subject.partner_other = 100.0 }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
