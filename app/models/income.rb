class Income < Base
  # attribute :on_benefits, Boolean
  #
  # validates :on_benefits, inclusion: { in: [true, false] }

  attribute :wages, Float
  attribute :child_benefit, Float
  attribute :working_tax_credit, Float
  attribute :child_tax_credit, Float
  attribute :maintenance_payment, Float
  attribute :contribution_JSA, Float
  attribute :contribution_ESA, Float
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
  attribute :partner_contribution_JSA, Float
  attribute :partner_contribution_ESA, Float
  attribute :partner_universal_credit, Float
  attribute :partner_pension, Float
  attribute :partner_rent_living_with, Float
  attribute :partner_rent_other_property, Float
  attribute :partner_other, Float

  validates :other_description, presence: true, if: :other_income?

  private

  def other_income?
    other.present? || partner_other.present?
  end
end
