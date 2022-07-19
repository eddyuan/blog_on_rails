Rails.application.routes.draw do
  ## Make the index from postsController homepage
  root "posts#index"
  resources :posts do
    ## Make comments sub of posts
    resources :comments, only: [:create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
