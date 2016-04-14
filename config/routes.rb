Rails.application.routes.draw do
  root 'home#index'

  get 'terms_and_conditions' => 'home#terms_and_conditions'
  get 'summary' => 'home#summary'

  resource :submission, only: [:create, :show]

  resources :questions, only: [:edit, :update], path_names: { edit: '' }
end
