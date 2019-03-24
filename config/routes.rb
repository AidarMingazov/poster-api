Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :posts, only: %i[index show new create edit update] do
    resources :comments, only: %i[create]
  end
  root to: "posts#index"
end
