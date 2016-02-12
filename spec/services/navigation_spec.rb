require 'rails_helper'

RSpec.describe Navigation do
  subject { described_class.new.steps }

  it { expect(subject[:marital_status]).to eq :savings_and_investment }
  it { expect(subject[:savings_and_investment]).to eq :benefit }
  it { expect(subject[:benefit]).to eq :fee }
  it { expect(subject[:fee]).to eq :probate }
  it { expect(subject[:probate]).to eq :claim }
  it { expect(subject[:claim]).to eq :form_name }
  it { expect(subject[:form_name]).to eq :summary }
end
