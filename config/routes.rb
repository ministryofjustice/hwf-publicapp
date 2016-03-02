Rails.application.routes.draw do
  root 'home#index'
  post 'apply' => 'home#create'
  get 'summary' => 'home#summary'
  get 'confirmation' => 'home#confirmation'

  HomeController::ACTIONS.each do |path|
    get path.to_s.dasherize => "home##{path}"
    post "#{path}_save" => "home##{path}_save"
  end
end
