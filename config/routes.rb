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
    post '/contact', to: "pages#send_contact_message", as: :mail_contact
  end
end
