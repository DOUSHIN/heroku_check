Rails.application.routes.draw do
  resources :users
  resources :logins, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
