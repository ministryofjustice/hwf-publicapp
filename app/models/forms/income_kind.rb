module Forms
  class IncomeKind < Base
    attribute :kinds, Array[Integer]

    validates_each :kinds do |record, attr, value|
      if value.blank?
        record.errors.add(attr, :blank)
      elsif value.any? { |v| !allowed_kinds.include?(v) }
        record.errors.add(attr, :invalid)
      end
    end

    def self.allowed_kinds
      (1..13).to_a
    end

    def permitted_attributes
      [kinds: []]
    end

    def update_attributes(attributes)
      attributes[:kinds].delete_if { |value| value == '' } if attributes[:kinds]
      super(attributes)
    end

    private

    def export_params
      {}
    end
  end
end
