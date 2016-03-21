Rails.application.routes.draw do
  root 'home#index'

  get 'summary' => 'home#summary'
  get 'confirmation' => 'home#confirmation'

  resources :questions, only: [:edit, :update], path_names: { edit: '' }

  HomeController::ACTIONS.each do |path|
    get path.to_s.dasherize => "home##{path}"
    post "#{path}_save" => "home##{path}_save"
  end
end
