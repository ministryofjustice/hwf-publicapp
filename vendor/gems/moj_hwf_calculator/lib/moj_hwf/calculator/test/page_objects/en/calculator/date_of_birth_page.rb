module MojHwf
  module Calculator
    module Test
      module En
        module Calculator
          class DateOfBirthPage < BasePage
            section :date_of_birth, ::MojHwf::Calculator::Test::QuestionDateSection, :calculator_question, 'What is your date of birth?'
            element :next_button, :button, 'Next step'

            def next
              next_button.click
            end
          end
        end
      end
    end
  end
end
