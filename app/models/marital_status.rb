class MaritalStatus < Base
  attribute :married, Boolean

  validates :married, inclusion: { in: [true, false] }

  private

  def export_params
    { married: married }
  end
end
