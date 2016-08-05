require 'rails_helper'

RSpec.describe Forms::IncomeRange, type: :model do
  subject(:form) { described_class.new(choice: choice) }

  describe '#export' do
    let(:choice) { 'more' }
    subject { form.export }

    context 'when "less"' do
      let(:choice) { 'less' }

      it 'returns a hash with income_min_threshold_exceeded set to false' do
        is_expected.to eql(income_min_threshold_exceeded: false)
      end
    end

    context 'when "between"' do
      let(:choice) { 'between' }

      it 'returns hash with income_min_threshold_exceeded parameter true and income_max_threshold_exceeded parameter false' do
        is_expected.to eql(income_min_threshold_exceeded: true, income_max_threshold_exceeded: false)
      end
    end

    context 'when "more"' do
      let(:choice) { 'more' }

      it 'returns hash with income_min_threshold_exceeded parameter true and income_max_threshold_exceeded parameter true' do
        is_expected.to eql(income_min_threshold_exceeded: true, income_max_threshold_exceeded: true)
      end
    end

    context 'when choice is not set' do
      let(:choice) { nil }

      it 'returns an empty hash' do
        is_expected.to eql({})
      end
    end
  end
end