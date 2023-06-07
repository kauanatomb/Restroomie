Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restrooms, only: [:index, :show, :destroy] do
    resources :reviews, only: :create
    get :bookmark
  end
  resources :bookmark, only: [:destroy]
  resources :reviews, only: :destroy

  get '/dashboard', to: 'dashboard#index'
end
