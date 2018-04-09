Rails.application.routes.draw do
  resources :recurring_events
  resources :events
  root to: 'visitors#index'
end
