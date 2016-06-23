require 'rails_helper'

RSpec.describe Views::Summary do
  let(:online_application) { build :online_application }
  subject(:summary) { described_class.new(online_application) }

  %i[married benefits children income probate deceased_name date_of_death
     probate ni_number date_of_birth full_name email_contact email_address].each do |method|
    it "delegates #{method} to the online_application" do
      expect(summary.send(method)).to eql(online_application.send(method))
    end
  end

  describe '#form_name' do
    let(:online_application) { build :online_application, form_name: form_name }

    subject { summary.form_name }

    context 'when the form_name is not nil' do
      let(:form_name) { 'SOME FORM NAME' }

      it { is_expected.to eql(form_name) }
    end

    context 'when the form_name is nil' do
      let(:form_name) { nil }

      it { is_expected.to eql('—') }
    end
  end

  describe '#savings' do
    subject { summary.savings }

    context 'when the minimum threshold has not been exceeded' do
      let(:online_application) { build :online_application, :savings_less_than_threshold }

      it 'returns the correct text - less than minimum threshold' do
        is_expected.to eql('£0 to £2,999')
      end
    end

    context 'when the minimum threshold has been exceeded but not the maximum threshold' do
      context 'when the applicant or partner are over 61' do
        let(:online_application) { build :online_application, :savings_between_threshold, over_61: true }

        it 'returns the correct text - between thresholds' do
          is_expected.to eql('£3,000 to £15,999')
        end
      end

      context 'when the applicant or partner are not over 61' do
        let(:online_application) { build :online_application, :savings_between_threshold, over_61: false, amount: 6000 }

        it 'returns the correct text - exact amount' do
          is_expected.to eql('£6,000')
        end
      end
    end

    context 'when the maximum threshold has been exceeded' do
      let(:online_application) { build :online_application, :savings_more_than_threshold }

      it 'returns the correct text - more than maximum threshold' do
        is_expected.to eql('£16,000 or more')
      end
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
