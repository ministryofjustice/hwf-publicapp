module MojHwf
  module Calculator
    module Test
      module En
        module Calculator
          class TotalSavingsPage < BasePage
            section :total_savings, ::MojHwf::Calculator::Test::QuestionNumericSection, :calculator_question, 'How much do you have in savings and investment combined?'
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
