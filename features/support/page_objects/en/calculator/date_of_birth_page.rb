module AppTest
  module En
    module Calculator
      class DateOfBirthPage < ::AppTest::En::Calculator::BasePage
        section :date_of_birth, ::AppTest::Calculator::QuestionDate, :calculator_question, 'What is your date of birth?'
        element :next_button, :button, 'Next step'

        def next
          next_button.click
        end
      end
    end
  end
end
