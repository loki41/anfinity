Rails.application.routes.draw do
  # get "projects/index"
  # get "projects/show"
  # get "pages/home"
  # get "pages/about"
  # get "pages/contact"
  # get "pages/projects"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"

  get "/about", to: "pages#about"
  get "/portfolio", to: "projects#index"
  get "/contact", to: "pages#contact"

  resources :projects, param: :slug

  namespace :admin do
    resources :projects, except: [:show], param: :slug
  end

  post '/contact', to: 'contacts#create', as: :contact_submit

  devise_for :users
  
  namespace :admin do
    resources :users, only: [:index] do
      member do
        patch :confirm
      end
    end
  end
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
