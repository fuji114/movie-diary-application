Rails.application.routes.draw do
  devise_for :users
  root to: "movies#index"

  resources :movies do
    resources :comments, only: [:create, :new]
  end
end
