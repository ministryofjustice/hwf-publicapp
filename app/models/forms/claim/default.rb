# frozen_string_literal: true
module Forms
  module Claim
    class Default < Forms::Base
      attribute :number, Boolean
      attribute :identifier, String

      validates :number, inclusion: { in: [true, false] }
      validates :identifier, presence: true, length: { maximum: 24 }, if: :number?

      private

      def export_params
        {
          case_number: number ? identifier : nil
        }
      end
    end
  end
end
