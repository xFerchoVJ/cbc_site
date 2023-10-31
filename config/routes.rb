Rails.application.routes.draw do
  devise_for :users
  authenticated :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :properties
      resources :users, only: [:index]
    end
  end
    root 'pages#index'
    get '/nosotros', to: "pages#about"
    get '/contacto', to: "pages#contact"
    get '/propiedades', to: "pages#properties", as: :plp_page
    get '/propiedades/:id', to: "pages#property", as: :pdp_page
    post '/contact', to: "pages#send_contact_message", as: :mail_contact
    match '/properties/filter', to: 'pages#filter', via: [:get, :post], as: :properties_filter
    resources :appointments, only: [:create]
end
