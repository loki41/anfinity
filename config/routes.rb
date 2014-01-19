Anfinity::Application.routes.draw do
  resources :todos

  resources :topics

  devise_for :users
  
  #root 'pages#underconstruction'
  root 'projects#index'
     
  resources :projects

  resources :recipes
  
  resources :comments

  resources :categories

  resources :posts
  
  get "/posts/year/:year"                 => "posts#index",  as: :post_year
  get "/posts/year/:year/month/:month"    => "posts#index",  as: :post_month
  get "/posts/category/:cat"			  => "posts#index",  as: :post_cat
  get "/posts/topic/:top"				  => "posts#index",  as: :post_top
  get "/posts/tags/:tag" 			      => "posts#index",	 as: :tag
  
  get '/about' => 'pages#about',      as: :about
  
  resources :inquiries, :only => [:new, :create] do
    get 'thank_you', :on => :collection
  end
  
  
  #Custom Error Generating controller
  get "/errors/not_found" => 'errors#not_found'
  get "/errors/server_error" => 'errors#server_error'
 
  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404', via: :get
  end
end
