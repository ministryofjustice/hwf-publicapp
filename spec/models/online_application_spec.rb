require 'rails_helper'

RSpec.describe OnlineApplication, type: :model do
  describe '#full_name' do
    subject(:model) { build(:online_application, title: title) }
    subject { model.full_name }

    context 'when title is set' do
      let(:title) { 'Title' }

      it 'contains title, first name and last name' do
        is_expected.to eql("#{title} #{model.first_name} #{model.last_name}")
      end
    end

    context 'when title is not set' do
      let(:title) { nil }

      it 'contains only first name and last name' do
        is_expected.to eql("#{model.first_name} #{model.last_name}")
      end
    end
  end

  describe '#et?' do
    subject { build(:online_application, case_number: case_number).et? }

    context 'when the case number is prefixed with ET' do
      let(:case_number) { 'ET something'}

      it { is_expected.to be true }
    end

    context 'when the case number starts with ET' do
      let(:case_number) { 'ET3'}

      it { is_expected.to be true }
    end

    context 'when the case number is not prefixed with ET' do
      let(:case_number) { 'N44' }

      it { is_expected.to be false }
    end

    context 'when the case number is blank' do
      let(:case_number) { nil }

      it { is_expected.to be false }
    end
  end
end
