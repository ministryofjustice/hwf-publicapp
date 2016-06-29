module Forms
  class IncomeRange < Base
    attribute :choice, Symbol

    validates :choice, inclusion: { in: %i[less between more] }
  end
end
