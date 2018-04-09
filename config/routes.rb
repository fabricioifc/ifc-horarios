Rails.application.routes.draw do
  resources :students do
    post :get_barcode, on: :collection
  end
  root to: 'visitors#index'
end
