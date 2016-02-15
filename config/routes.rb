Rails.application.routes.draw do
  root 'home#index'
  get 'summary' => 'home#summary'

  HomeController::ACTIONS.each do |path|
    get path.to_s.dasherize => "home##{path}"
    post "#{path}_save" => "home##{path}_save"
  end
end
