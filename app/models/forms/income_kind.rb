module Forms
  class IncomeKind < Base
    attribute :kinds, Array[Integer]

    validates_each :kinds do |record, attr, value|
      if value.blank?
        record.errors.add(attr, :blank)
      elsif value.any? { |v| !self.allowed_kinds.include?(v) }
        record.errors.add(attr, :invalid)
      end
    end

    def self.allowed_kinds
      (1..13).to_a
    end
  end
end
