Rails.application.routes.draw do
  resources :events
  root to: 'visitors#index'
end
