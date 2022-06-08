Rails.application.routes.draw do
  devise_for :users
  root to:"items#index"

  resources :items do
    resources :buying_items, only: [:index,:create]
  end
end
