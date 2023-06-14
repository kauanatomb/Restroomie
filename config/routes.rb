Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restrooms do
    resources :reviews, only: [:create, :index]
    get :bookmark
  end
  resources :bookmark, only: [:destroy]
  resources :reviews, only: :destroy

  get '/dashboard', to: 'dashboard#index'
  get '/bookmarks', to: 'bookmarks#index'
  get '/reviews', to: 'reviews#dashboard_reviews'
end
