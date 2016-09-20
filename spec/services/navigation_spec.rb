require 'rails_helper'

RSpec.describe Navigation do
  include Rails.application.routes.url_helpers

  let(:online_application) { build :online_application }

  describe '#next' do
    subject { described_class.new(online_application, current_question).next }

    {
      form_name: :fee,
      fee: :marital_status,
      marital_status: :savings_and_investment,
      savings_and_investment_extra: :benefit,
      dependent: :income_kind,
      income_amount: :probate,
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
      let(:online_application) { build :online_application, benefits: benefits, form_name: form_name }
      let(:current_question) { :benefit }
      let(:form_name) { nil }

      context 'when the application is benefit one' do
        let(:benefits) { true }

        it 'routes to the probate question (skips dependent and income)' do
          is_expected.to eql(question_path(:probate))
        end

        context 'when the application is for ET' do
          let(:form_name) { 'ET1' }
          it 'routes to the claim question (skips dependent and income)' do
            is_expected.to eql(question_path(:claim))
          end
        end
      end

      context 'when the application is not a benefit one' do
        let(:benefits) { false }

        it 'routes to the dependent question' do
          is_expected.to eql(question_path(:dependent))
        end
      end
    end

    context 'for savings and investment question' do
      let(:current_question) { :savings_and_investment }

      context 'when the extra question is required' do
        let(:online_application) { build :online_application, :extra_savings_question_required }

        it 'routes to the extra question' do
          is_expected.to eql(question_path(:savings_and_investment_extra))
        end
      end

      context 'when the extra question is not required' do
        let(:online_application) { build :online_application }

        it 'routes to the benefit question' do
          is_expected.to eql(question_path(:benefit))
        end
      end
    end

    context 'for contact question' do
      let(:current_question) { :contact }

      it 'routes to the summary page' do
        is_expected.to eql(summary_path)
      end
    end

    context 'for income_kind question' do
      let(:current_question) { :income_kind }

      context 'when the application is 0 income - "no income" selected' do
        let(:online_application) { build :online_application, :no_income }

        it 'routes to the probate question' do
          is_expected.to eql(question_path(:probate))
        end
      end

      context 'when the application is not 0 income - some income sources selected' do
        it 'routes to the income_range question' do
          is_expected.to eql(question_path(:income_range))
        end
      end
    end

    context 'for income_range question' do
      let(:current_question) { :income_range }

      context 'when the application is between thresholds' do
        let(:online_application) { build :online_application, :income_between_thresholds }

        it 'routes to the income_amount question' do
          is_expected.to eql(question_path(:income_amount))
        end
      end

      context 'when the application is below thresholds' do
        let(:online_application) { build :online_application, :income_below_thresholds }

        it 'routes to the probate question' do
          is_expected.to eql(question_path(:probate))
        end
      end

      context 'when the application is above thresholds' do
        let(:online_application) { build :online_application, :income_above_thresholds }

        it 'routes to the probate question' do
          is_expected.to eql(question_path(:probate))
        end
      end
    end

  end
end
