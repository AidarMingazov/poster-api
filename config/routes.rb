Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :posts, only: %i[index show new create edit update] do
    resources :comments, only: %i[create]
    resources :ratings, defaults: { format: "js" }, only: %i[create]
  end
  resources :my_posts, only: %i[index]
  resources :contact, only: %i[new create]
  root to: "posts#index"
end
