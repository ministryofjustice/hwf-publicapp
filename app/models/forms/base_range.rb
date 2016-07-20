module Forms
  class BaseRange < Base
    attribute :choice, Symbol

    validates :choice, inclusion: { in: %i[less between more] }
  end
end
