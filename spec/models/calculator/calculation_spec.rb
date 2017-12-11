require 'rails_helper'

module Calculator
  RSpec.describe Calculation do
    context '#inputs' do
      it 'stores a provided value of any type' do
        subject = described_class.new inputs: { any: :value }
        expect(subject.inputs).to eql(any: :value)
      end
    end

    context '#should_get_help' do
      it 'stores a provided value of any type' do
        subject = described_class.new should_get_help: true
        expect(subject.should_get_help).to be true
      end
    end

    context '#should_not_get_help' do
      it 'stores a provided value of any type' do
        subject = described_class.new should_not_get_help: true
        expect(subject.should_not_get_help).to be true
      end
    end

    context '#messages' do
      it 'stores a provided value of any type' do
        subject = described_class.new messages: [:any]
        expect(subject.messages).to eql [:any]
      end
    end

    context '#fields_required' do
      it 'stores a provided value of any type' do
        subject = described_class.new fields_required: [:any]
        expect(subject.fields_required).to eql [:any]
      end
    end

    context '#fields' do
      it 'stores a provided value of any type' do
        subject = described_class.new fields: { name: :any}
        expect(subject.fields).to eql({ name: :any })
      end
    end

  end
end