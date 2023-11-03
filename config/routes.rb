Rails.application.routes.draw do
  devise_for :users
  authenticated :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :properties
      resources :users, only: [:index]
      resources :appointments, only: [:index, :show]
    end
  end
    root 'pages#index'
    get '/nosotros', to: "pages#about"
    get '/contacto', to: "pages#contact"
    resources :properties, only: [:index, :show]
    post '/contact', to: "pages#send_contact_message", as: :mail_contact
    match '/properties/filter', to: 'pages#filter', via: [:get, :post], as: :properties_filter
    resources :appointments, only: [:create]
end
