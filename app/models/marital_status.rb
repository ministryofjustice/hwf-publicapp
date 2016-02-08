class MaritalStatus < Base
  attribute :married, Boolean

  validates :married, inclusion: { in: [true, false] }
end
