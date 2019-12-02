Rails.application.routes.draw do
  devise_for :users
  resources :items do
    member do
      patch :completed
    end
  end
  root "items#index"
end
