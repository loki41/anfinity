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
  get "/posts/tags/:tag" 			      => "posts#index",	 as: :tag
  
  get '/about' => 'pages#about',      as: :about
  
  resources :inquiries, :only => [:new, :create] do
    get 'thank_you', :on => :collection
  end
end
