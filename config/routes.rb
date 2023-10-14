Rails.application.routes.draw do
  devise_for :users
  authenticated :user, ->(user) { user.admin? } do
    namespace :admin do
      get '/dashboard', to: "dashboard#index"
      resources :properties
    end
  end
  unauthenticated do
    root 'pages#index'
    get '/nosotros', to: "pages#about"
  end
end
