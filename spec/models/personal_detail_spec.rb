require 'rails_helper'

RSpec.describe PersonalDetail, type: :model do

  subject { described_class.new(title: 'Lord', first_name: 'Flash', last_name: 'Gordon') }

  describe 'validations' do

    context 'when all the attributes are provided' do
      it { expect(subject.valid?).to be true }
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

  describe '#export' do
    let(:title) { 'TITLE' }
    let(:first_name) { 'FIRST NAME' }
    let(:last_name) { 'LAST NAME' }

    subject { described_class.new(title: title, first_name: first_name, last_name: last_name).export }

    it 'returns hash with title, first_name and last_name' do
      is_expected.to eql(title: title, first_name: first_name, last_name: last_name)
    end
  end

end
