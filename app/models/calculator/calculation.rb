module Calculator
  class Calculation
    include ActiveModel::Model
    attr_accessor :inputs, :should_get_help, :should_not_get_help, :fields_required, :messages, :fields


  end
end