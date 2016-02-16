class Base
  include Virtus.model(nullify_blank: true)
  include ActiveModel::Model

  def scope
    "questions.#{self.class.to_s.underscore}"
  end
end
