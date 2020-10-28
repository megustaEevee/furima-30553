Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "items#index"
  
  resources :items  do
    resources :orders, only: [:index, :create]
    resource :comments, only: [:create]
    member do
      get 'kanryou', 'kounyu'
    end
  end

end