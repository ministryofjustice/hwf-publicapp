Rails.application.routes.draw do
  root 'home#index'

  get 'summary' => 'home#summary'
  get 'confirmation' => 'home#confirmation'

  resources :questions, only: [:edit, :update], path_names: { edit: '' }
end
