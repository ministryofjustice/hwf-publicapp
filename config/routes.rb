Rails.application.routes.draw do
  root 'home#index'
  get 'marital-status' => 'home#marital_status'
  post 'marital_status_save' => 'home#marital_status_save'
  get 'summary' => 'home#summary'
end
