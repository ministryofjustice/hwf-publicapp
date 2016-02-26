require 'rails_helper'

RSpec.describe Navigation do
  subject { described_class.new.steps }

  it { expect(subject[:marital_status]).to eq :savings_and_investment }
  it { expect(subject[:savings_and_investment]).to eq :benefit }
  it { expect(subject[:benefit]).to eq :dependent }
  it { expect(subject[:dependent]).to eq :income }
  it { expect(subject[:income]).to eq :fee }
  it { expect(subject[:fee]).to eq :probate }
  it { expect(subject[:probate]).to eq :claim }
  it { expect(subject[:claim]).to eq :form_name }
  it { expect(subject[:form_name]).to eq :national_insurance }
  it { expect(subject[:national_insurance]).to eq :personal_detail }
  it { expect(subject[:personal_detail]).to eq :applicant_address }
  it { expect(subject[:applicant_address]).to eq :contact }
  it { expect(subject[:contact]).to eq :summary }
end
