Rails.application.routes.draw do
  resources :disciplines
  resources :turmas
  resources :recurring_events
  resources :events
  root to: 'visitors#index'
end
