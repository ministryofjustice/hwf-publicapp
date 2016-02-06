class Status
  include Virtus.model(nullify_blank: true)
  include ActiveModel::Model

  attribute :married, Boolean

  validates :married, inclusion: { in: [true, false] }
end
