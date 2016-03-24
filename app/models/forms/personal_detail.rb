module Forms
class PersonalDetail < Base
  attribute :title, String
  attribute :first_name, String
  attribute :last_name, String

  validates :first_name, presence: true
  validates :last_name, presence: true

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
