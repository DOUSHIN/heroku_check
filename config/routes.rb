Rails.application.routes.draw do
  resources :users
  resources :logins, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy, :index]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  root 'users#new'
end
