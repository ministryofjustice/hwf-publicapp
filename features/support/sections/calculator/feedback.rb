module AppTest
  module Calculator
    class Feedback < ::SitePrism::Section
      def positive_message_saying(msg)
        find '[data-behavior=calculator_feedback_message]', text: msg
      end

    end
  end
end
