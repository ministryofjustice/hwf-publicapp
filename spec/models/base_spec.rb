require 'rails_helper'

RSpec.describe Base, type: :model do
  subject { described_class.new }

  it { is_expected.to respond_to :i18n_scope }

  describe '.i18n_scope' do
    it 'returns the calling object name prefixed with "questions."' do
      expect(subject.i18n_scope).to eql 'questions.base'
    end
  end
end
