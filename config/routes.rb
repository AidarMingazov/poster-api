Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :posts, only: %i[index show new create edit update] do
    resources :comments, only: %i[create]
  end
  namespace :admin do
    resources :posts, only: %i[update index edit]
  end
  root to: "posts#index"
end
