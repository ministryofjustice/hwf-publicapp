require 'rails_helper'

RSpec.describe Storage do
  let(:current_time) { Time.zone.now }

  class MockSession < Hash
    def destroy
    end
  end

  subject(:storage) { described_class.new(session) }

  describe '#initialize' do
    let(:session) { MockSession[used_at: used_at.to_s, started_at: started_at.to_s] }

    subject do
      Timecop.freeze(current_time) do
        storage
      end
    end

    context 'when the storage has been started' do
      let(:started_at) { current_time }

      context 'when it was used more than 10 minutes ago' do
        let(:used_at) { current_time - 11.minutes }

        it 'raises an error and clears the session' do
          expect(session).to receive(:destroy)
          expect { subject }.to raise_error(Storage::Expired)
        end
      end

      context 'when it was used less than 10 minutes ago' do
        let(:used_at) { current_time - 5.minutes }

        before { subject }

        it 'stores the current time to the session, as time of last used' do
          expect(session[:used_at]).to eql(current_time)
        end
      end

      context 'when the storage was just initialised for the first time' do
        let(:session) { {} }

        before { subject }

        it 'stores the current time to the session, as time of last used' do
          expect(session[:used_at]).to eql(current_time)
        end
      end
    end

    context 'when the storage has not been started' do
      let(:started_at) { nil }
      let(:used_at) { nil }

      before { subject }

      it 'stores the current time to the session, as time of last used' do
        expect(session[:used_at]).to eql(current_time)
      end
    end
  end

  describe '#start' do
    let(:session) { {} }

    before do
      Timecop.freeze(current_time) do
        storage.start
      end
    end

    it 'sets started_at to the session as the current time' do
      expect(session).to include(started_at: current_time)
    end
  end

  describe '#started?' do
    subject { storage.started? }

    context 'when the session has started_at timestamp setup' do
      let(:session) { { started_at: current_time } }

      it { is_expected.to be true }
    end

    context 'when there started_at timestamp on the session' do
      let(:session) { { another: 'key' } }

      it { is_expected.to be false }
    end
  end

  describe '#time_taken' do
    let(:session) { {} }

    subject { storage.time_taken }

    context 'when started_at is not set' do
      it { is_expected.to be nil }
    end

    context 'when started_at is stored in the session as a string' do
      let(:session) { { started_at: current_time.to_s } }

      it { is_expected.to be_a Integer }
    end

    context 'when started_at is 10 minutes old' do
      let(:session) { { started_at: current_time - 10.minutes } }

      it { is_expected.to eq 600000 }
    end
  end

  describe '#save_form' do
    let(:id) { 'ID' }
    let(:json_data) { { some: 'data' } }

    let(:session) { {} }
    let(:form) { double(id: id, as_json: json_data) }

    before do
      storage.save_form(form)
    end

    it 'sets the json data to the session' do
      expect(session['questions'][id]).to eql(json_data)
    end
  end

  describe '#load_form' do
    let(:id) { 'ID' }
    let(:json_data) { { some: 'data' } }

    let(:form) { double(id: id, update_attributes: nil) }

    before do
      storage.load_form(form)
    end

    context 'when the data with the form id is in the session' do
      let(:session) { { 'questions' => { id => json_data } } }

      it 'updates the form with the data' do
        expect(form).to have_received(:update_attributes).with(json_data)
      end
    end

    context 'when there is no data with the form id in the session' do
      let(:session) { { 'questions' => {} } }

      it 'updates the form with an empty hash' do
        expect(form).to have_received(:update_attributes).with({})
      end
    end
  end

  describe '#submission_result=' do
    let(:result) { double }

    let(:session) { {} }

    before do
      storage.submission_result = result
    end

    it 'stores the submission_result in the session' do
      expect(session[:submission_result]).to eql(result)
    end
  end

  describe '#submission_result' do
    let(:result) { double }

    subject { storage.submission_result }

    context 'when there is a submission_result stored in the session' do
      let(:session) { { submission_result: result } }

      it { is_expected.to eql(result) }
    end
    context 'when there is no submission_result stored in the session' do
      let(:session) { {} }

      it { is_expected.to be nil }
    end
  end
end
