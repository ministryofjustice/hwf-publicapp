Rails.application.routes.draw do

  mount MojHwf::Calculator::Engine => "/calculator"
end
