module Forms
  class IncomeKind < Base
    attribute :kinds, Array[Integer]
    attribute :partner, Array[Integer]

    validates_each :kinds do |record, attr, value|
      if value.blank?
        record.errors.add(attr, :blank)
      elsif value.any? { |v| !allowed_kinds.include?(v) }
        record.errors.add(attr, :invalid)
      end
    end

    validates_each :partner do |record, attr, value|
      if value.any? { |v| !allowed_kinds.include?(v) }
        record.errors.add(attr, :invalid)
      end
    end

    def self.allowed_kinds
      (1..13).to_a
    end

    def self.no_income_index
      13
    end

    def permitted_attributes
      [kinds: [], partner: []]
    end

    def update_attributes(attributes)
      attributes[:kinds].delete_if { |value| value == '' } if attributes[:kinds]
      attributes[:partner].delete_if { |value| value == '' } if attributes[:partner]
      super(attributes)
    end

    private

    def export_params
      {}.tap do |export|
        export[:income] = 0 if kinds == [self.class.no_income_index]
      end
    end
  end
end
