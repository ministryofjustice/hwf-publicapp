# frozen_string_literal: true
module Forms
  class HelpRequest < Base
    attribute :name, String
    attribute :phone, String
    attribute :description, String

    validates :name, :phone, :description, presence: true
  end
end
