Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'search', to: 'posts#search'
  resources :categories, only: [:create, :index, :destroy]
  resources :posts, only: [:new, :create, :index, :show] do
  	resource :messages, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
