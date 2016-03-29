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
end
