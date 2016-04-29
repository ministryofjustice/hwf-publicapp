require 'rails_helper'

RSpec.describe HealthStatus::HealthCheck, type: :service do
  subject(:service) { described_class.new }

  let(:submit_application) { double(available?: submit_application_available?) }

  before do
    allow(SubmitApplication).to receive(:new).and_return(submit_application)
  end

  describe '#as_json' do
    subject { service.as_json }

    context 'when the submission api is available' do
      let(:submit_application_available?) { true }

      it 'returns hash with all services ok' do
        is_expected.to eql(
          submission_api: {
            description: 'Submission API',
            ok: true
          },
          ok: true
        )
      end
    end

    context 'when the submission api is not available' do
      let(:submit_application_available?) { false }

      it 'returns hash with services unavailable' do
        is_expected.to eql(
          submission_api: {
            description: 'Submission API',
            ok: false
          },
          ok: false
        )
      end

    end
  end

  describe '#healthy?' do
    subject { service.healthy? }

    context 'when the submission api is available' do
      let(:submit_application_available?) { true }

      it { is_expected.to be true }
    end

    context 'when the submission api is not available' do
      let(:submit_application_available?) { false }

      it { is_expected.to be false }
    end
  end
end
