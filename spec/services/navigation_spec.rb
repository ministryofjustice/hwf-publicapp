require 'rails_helper'

RSpec.describe Navigation do
  subject { described_class.new.steps }

  it { expect(subject[:marital_status]).to eq :savings_and_investment }
  it { expect(subject[:savings_and_investment]).to eq :summary }
end
