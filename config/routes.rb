Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "lists#index"
  root to: 'lists#index'

  resources :lists, only: %i[index show new create destroy] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: :destroy
end
