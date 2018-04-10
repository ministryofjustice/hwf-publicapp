module Forms
  class HelpRequest < Base
    attribute :name, String
    attribute :email, String
    attribute :description, String

    validates :name, :email, :description, presence: true
  end
end
