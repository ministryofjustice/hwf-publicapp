Rails.application.routes.draw do
  root 'home#index'

  get 'terms_and_conditions' => 'home#terms_and_conditions'

  resources :questions, only: [:edit, :update], path_names: { edit: '' }

  resource :summary, only: :show

  resource :submission, only: [:create, :show]

  resource :session, only: :destroy do
    get :start
  end

  get 'ping' => 'health_status/ping#show'
  get 'healthcheck' => 'health_status/health_check#show'
end
