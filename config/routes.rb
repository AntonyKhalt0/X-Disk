Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "users#index", as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :attached_files, only: %i[create destroy]
end
