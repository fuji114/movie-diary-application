Rails.application.routes.draw do
  resources :meetings
  devise_for :users
  root to: "movies#index"

  resources :movies do
    collection do
      get 'search'
    end
    resources :comments, only: [:create, :new]
  end
  resources :users, only: [:show]
end
