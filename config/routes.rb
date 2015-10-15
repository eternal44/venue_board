Rails.application.routes.draw do
  devise_for :employers
  resources :jobs

  # logged-in root
  authenticated :employer do
    root to: "jobs#index", as: :authenticated_root, via: :get
  end
end
