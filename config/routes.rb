Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restrooms, only: [:index, :show, :destroy] do
    resources :reviews, only: [:create, :index]
    get :bookmark
  end
  resources :bookmarks, only: [:destroy]
  resources :reviews, only: [:destroy]
end
