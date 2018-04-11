Rails.application.routes.draw do
  resources :recurring_events
  resources :disciplines
  resources :turmas
  resources :events
  root to: 'visitors#index'
end
