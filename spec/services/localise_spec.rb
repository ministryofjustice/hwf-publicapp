require 'rails_helper'

RSpec.describe Localise do
  describe '.i18n' do
    let(:foo) do
      class Foo; end
      Foo.new
    end

    it 'returns the full i18n localisation path' do
      expect(described_class.i18n(foo, 'bar')).to eq 'questions.foo.bar'
    end
  end
end
