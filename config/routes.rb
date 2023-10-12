Rails.application.routes.draw do
  devise_for :users
  authenticated :user, ->(user) { user.admin? } do
    # Personaliza la ruta del dashboard para que incluya "/dashboard"
    get '/dashboard', to: "dashboard#index", as: :admin_dashboard
    root to: "dashboard#index" # Ruta raíz para el administrador
  end
  unauthenticated do
    root 'pages#index', as: :root_clients
  end
  get '/nosotros', to: "pages#about"
end
