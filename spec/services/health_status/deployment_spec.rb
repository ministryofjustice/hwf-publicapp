require 'rails_helper'

RSpec.describe HealthStatus::Deployment, type: :service do
  subject(:service) { described_class.new }

  describe '#as_json' do
    let(:version_number) { 'VN' }
    let(:build_date) { 'BD' }
    let(:commit_id) { 'CI' }
    let(:build_tag) { 'BT' }

    let(:settings) { double(version_number: version_number, build_date: build_date, commit_id: commit_id, build_tag: build_tag) }

    before do
      allow(Settings.health_status).to receive(:deployment).and_return(settings)
    end

    it 'returns hash with deployment information available from the Settings' do
      expect(service.as_json).to eql(
        version_number: version_number,
        build_date: build_date,
        commit_id: commit_id,
        build_tag: build_tag
      )
    end
  end
end
