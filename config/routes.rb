Rails.application.routes.draw do
  resources :disciplines
  resources :turmas
  resources :events
  root to: 'visitors#index'
end
