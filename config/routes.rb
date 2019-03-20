Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :posts, only: %i[show new create edit update]
  root to: "pages#home"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "signup", to: "registrations#create", only: :create
    end
  end
end
