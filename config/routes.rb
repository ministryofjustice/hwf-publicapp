Rails.application.routes.draw do
  root 'home#index'
  get 'status' => 'home'
end
