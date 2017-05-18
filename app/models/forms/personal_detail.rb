module Forms
  class PersonalDetail < Base
    attribute :title, String
    attribute :first_name, String
    attribute :last_name, String

    validates :title, length: { maximum: 9 }
    validates :first_name, presence: true, length: { maximum: 49 }
    validates :last_name, presence: true, length: { maximum: 49 }

    private

    def export_params
      {
        title: title,
        first_name: first_name,
        last_name: last_name
      }
    end
  end
end
