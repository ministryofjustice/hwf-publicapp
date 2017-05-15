# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Forms::HelpRequest, type: :model do
  subject { described_class.new }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to validate_presence_of(:description) }
end
