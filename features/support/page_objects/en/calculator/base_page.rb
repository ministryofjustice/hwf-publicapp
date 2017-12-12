module AppTest
  module En
    module Calculator
      class BasePage < ::SitePrism::Page
        section :feedback, ::AppTest::Calculator::Feedback, '[data-behavior=calculator_feedback]'
        section :previous_answers, '[data-behavior=calculator_previous_questions]' do |s|
          section :total_savings, ::AppTest::Calculator::PreviousQuestion, :calculator_previous_question, "How much do you have in savings and investment combined?"
        end
        def positive_feedback_message_saying(msg)
          feedback.positive_message_saying(msg)
        end
      end
    end
  end
end
