module AppTest
  module Calculator
    class QuestionRadioList < ::SitePrism::Section
      def set(value)
        choose(value)
      end
    end
  end
end