class Benefits
  include Virtus.model(nullify_blank: true)
  include ActiveModel::Model

  attribute :on_benefits, Boolean

  validates :on_benefits, inclusion: { in: [true, false] }
end
