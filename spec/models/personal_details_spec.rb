require 'rails_helper'

RSpec.describe PersonalDetails, type: :model do

  subject { described_class.new(title: 'Lord', first_name: 'Flash', last_name: 'Gordon') }

  describe 'validations' do

    context 'when all the attributes are provided' do
      it { expect(subject.valid?).to be true }
    end

    describe 'title' do
      context 'when title not provided' do
         before { subject.title = '' }

        it { expect(subject.valid?).to be false }
      end
    end

    describe 'first_name' do
      context 'when not provided' do
        before { subject.first_name = '' }

        it { expect(subject.valid?).to be false }
      end
    end

    describe 'last_name' do
      context 'when not provided' do
        before { subject.last_name = '' }

        it { expect(subject.valid?).to be false }
      end
    end
  end
end
