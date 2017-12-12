module AppTest
  module Calculator
    class QuestionNumeric < ::SitePrism::Section
      element :field, 'input'
      def set(value)
        field.set(value)
      end
    end
  end
end