module Forms
  class Income < Base
    attribute :wages, Float
    attribute :child_benefit, Float
    attribute :working_tax_credit, Float
    attribute :child_tax_credit, Float
    attribute :maintenance_payment, Float
    attribute :contribution_jsa, Float
    attribute :contribution_esa, Float
    attribute :universal_credit, Float
    attribute :pension, Float
    attribute :rent_living_with, Float
    attribute :rent_other_property, Float
    attribute :other, Float
    attribute :other_description, String
    attribute :partner_wages, Float
    attribute :partner_child_benefit, Float
    attribute :partner_working_tax_credit, Float
    attribute :partner_child_tax_credit, Float
    attribute :partner_maintenance_payment, Float
    attribute :partner_contribution_jsa, Float
    attribute :partner_contribution_esa, Float
    attribute :partner_universal_credit, Float
    attribute :partner_pension, Float
    attribute :partner_rent_living_with, Float
    attribute :partner_rent_other_property, Float
    attribute :partner_other, Float

    validates :other_description, presence: true, length: { maximum: 19 }, if: :other_income?

    validate :either_other_income

    private

    def other_income?
      other.present? || partner_other.present?
    end

    def either_other_income
      if other_description.present? && other.blank? && partner_other.blank?
        errors.add(:combined_other_payments, I18n.t('errors.combined_other_payments_invalid'))
      end
    end

    def export_params
      usable = attributes.select { |_, v| v.is_a?(Float) }.values
      {
        income: usable.empty? ? 0 : usable.inject(:+)
      }
    end
  end
end
