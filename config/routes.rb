Rails.application.routes.draw do
  get 'static_pages/home'

  devise_for :admins, controllers: { registraions: "admins/registrations" }
  devise_for :employers
  resources :jobs

  # logged-in root
  authenticated :admin do
    root to: "jobs#index", as: :authenticated_admin_root, via: :get
  end

  # logged-in root
  authenticated :employer do
    root to: "jobs#index", as: :authenticated_employer_root, via: :get
  end

  # visotrs root
  unauthenticated do
    root to: "static_pages#home"
  end
end
