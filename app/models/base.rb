class Base
  include Virtus.model(nullify_blank: true)
  include ActiveModel::Model
end
