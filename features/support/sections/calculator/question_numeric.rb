module AppTest
  module Calculator
    class QuestionNumeric < ::SitePrism::Section
      element :field, 'input'
      delegate :set, to: :field
    end
  end
end
