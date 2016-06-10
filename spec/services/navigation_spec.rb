require 'rails_helper'

RSpec.describe Navigation do
  include Rails.application.routes.url_helpers

  let(:online_application) { build :online_application }

  describe '#next' do
    subject { described_class.new(online_application, current_question).next }

    {
      form_name: :marital_status,
      marital_status: :savings_and_investment,
      savings_and_investment: :savings_and_investment_extra,
      savings_and_investment_extra: :benefit,
      dependent: :income,
      income: :fee,
      fee: :probate,
      probate: :claim,
      claim: :national_insurance,
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

    context 'for benefit question' do
      let(:online_application) { build :online_application, benefits: benefits }
      let(:current_question) { :benefit }

      context 'when the application is benefit one' do
        let(:benefits) { true }

        it 'routes to the fee question (skips dependent and income)' do
          is_expected.to eql(question_path(:fee))
        end
      end
      context 'when the application is not a benefit one' do
        let(:benefits) { false }

        it 'routes to the dependent question' do
          is_expected.to eql(question_path(:dependent))
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
