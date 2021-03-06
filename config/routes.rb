Rails.application.routes.draw do
  devise_for :users
  get '/users', to: redirect("/users/sign_up")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get "search"
      get "explain"
    end
  end
  resources :users, only: [:show] do
    member do
      get "profile"
    end
  end

end
