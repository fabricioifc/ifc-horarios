Rails.application.routes.draw do
  devise_for :users
  resources :recurring_events
  resources :disciplines
  resources :turmas
  resources :events#, except: [:new]
  root to: 'visitors#index'
end
