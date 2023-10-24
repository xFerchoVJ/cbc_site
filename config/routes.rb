Rails.application.routes.draw do
  devise_for :users
  authenticated :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :properties
    end
  end
  unauthenticated do
    root 'pages#index'
    get '/nosotros', to: "pages#about"
    get '/contacto', to: "pages#contact"
    get '/propiedades', to: "pages#properties", as: :plp_page
    post '/contact', to: "pages#send_contact_message", as: :mail_contact
    match '/properties/filter', to: 'pages#filter', via: [:get, :post], as: :properties_filter
  end
end
