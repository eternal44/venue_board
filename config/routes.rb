Rails.application.routes.draw do
  get 'static_pages/home'

  devise_for :employers
  resources :jobs

  # logged-in root
  authenticated :employer do
    root to: "jobs#index", as: :authenticated_root, via: :get
  end

  # visotrs root
  unauthenticated do
    root to: "static_pages#home"
  end
end
