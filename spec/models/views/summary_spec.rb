require 'rails_helper'

RSpec.describe Views::Summary do
  let(:online_application) { build :online_application }
  subject(:summary) { described_class.new(online_application) }

  %i[married threshold_exceeded benefits children income probate deceased_name date_of_death
     probate form_name ni_number date_of_birth full_name email_contact email_address].each do |method|
    it "delegates #{method} to the online_application" do
      expect(summary.send(method)).to eql(online_application.send(method))
    end
  end

  describe '#refund_text' do
    subject { summary.refund_text }

    context 'when refund is true' do
      let(:online_application) { build :online_application, refund: true, date_fee_paid: '01/02/2016' }

      it 'returns Yes with date paid' do
        is_expected.to eql('Yes, on 01/02/2016')
      end
    end

    context 'when refund is false' do
      it { is_expected.to eql('No') }
    end
  end

  describe '#children_text' do
    subject { summary.children_text }

    context 'when children is 0' do
      it { is_expected.to eql('No') }
    end

    context 'when children is greater than 0' do
      let(:online_application) { build :online_application, children: 3 }

      it 'returns the number of children' do
        is_expected.to eql('3')
      end
    end
  end

  describe '#case_number?' do
    subject { summary.case_number? }

    context 'when case_number is set' do
      let(:online_application) { build :online_application, case_number: 'BBB' }

      it { is_expected.to be true }
    end

    context 'when case_number is not set' do
      it { is_expected.to be false }
    end
  end

  describe '#full_address' do
    let(:online_application) { build :online_application, address: 'Street, City', postcode: 'POSTCODE' }

    it 'returns address and postcode with space between' do
      expect(summary.full_address).to eql('Street, City POSTCODE')
    end
  end
end
