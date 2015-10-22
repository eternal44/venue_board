Rails.application.routes.draw do
  get 'static_pages/home'

  devise_for :admins, controllers: { registraions: "admins/registrations" }
  devise_for :users
  resources :jobs
  resources :profiles, only: [:show, :update, :edit]

  # logged-in root
  authenticated :admin do
    root to: "jobs#index", as: :authenticated_admin_root, via: :get
  end

  # user logged-in root
  authenticated :user do
    root to: "jobs#index", as: :authenticated_user_root, via: :get
  end

  # visitors root
  unauthenticated do
    root to: "static_pages#home"
  end
end
