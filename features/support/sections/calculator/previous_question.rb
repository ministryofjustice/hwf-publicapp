module AppTest
  module Calculator
    class PreviousQuestion < ::SitePrism::Section
      element :answer, '[data-behavior=answer]'
    end
  end
end