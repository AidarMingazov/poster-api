Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :posts, only: %i[index show new create edit update] do
    resources :comments, only: %i[create]
  end
  resources :contact, only: %i[new create]
  root to: "posts#index"
end
