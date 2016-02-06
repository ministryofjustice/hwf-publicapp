Rails.application.routes.draw do
  root 'home#index'
  get 'marital-status' => 'home#marital_status'
end
