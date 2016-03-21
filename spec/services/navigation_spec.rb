require 'rails_helper'

RSpec.describe Navigation do
  include Rails.application.routes.url_helpers

  describe '#next' do
    subject { described_class.new(current_question).next }

    {
      marital_status: :savings_and_investment,
      savings_and_investment: :benefit,
      benefit: :dependent,
      dependent: :income,
      income: :fee,
      fee: :probate,
      probate: :claim,
      claim: :form_name,
      form_name: :national_insurance,
      national_insurance: :dob,
      dob: :personal_detail,
      personal_detail: :applicant_address,
      applicant_address: :contact
    }.each do |current_question, next_question|
      context "for #{current_question} question" do
        let(:current_question) { current_question }

        it "routes to #{next_question} question" do
          is_expected.to eql(question_path(next_question))
        end
      end
    end

    context 'for contact question' do
      let(:current_question) { :contact }

      it 'routes to the summary page' do
        is_expected.to eql(summary_path)
      end
    end
  end
end
