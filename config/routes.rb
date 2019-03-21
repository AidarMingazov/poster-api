Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :posts, only: %i[show new create edit update]
  root to: "pages#home"
end
