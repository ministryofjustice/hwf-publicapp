Rails.application.routes.draw do
  root 'home#index'

  get 'terms_and_conditions' => 'home#terms_and_conditions'

  resources :questions, only: [:edit, :update], path_names: { edit: '' }

  resource :summary, only: :show

  resource :submission, only: [:create, :show]

  resource :session, only: :destroy do
    get :start
  end
end
