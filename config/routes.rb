Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  
  resources :items  do
    resources :orders, only: [:index, :create]
    member do
      get 'kanryou', 'kounyu'
    end
  end
end