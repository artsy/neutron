Rails.application.routes.draw do
  resources :articles, only: [:index, :edit, :new, :create, :update]
  # root "home#index"
end
