AllStarAppliance::Application.routes.draw do
  resources :endorsements

  resources :emails

  resources :customers

  resources :addresses

  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "/contact", to: "pages#contact", as: "contact"
  get "/mission", to: "pages#mission", as: "mission"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"

  get "posts", to: "pages#posts", as: "posts"
  get "posts/:id", to: "pages#show_post", as: "post"
  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users
    resources :customers do
      resources :emails
      resources :phones
      resources :addresses
    end
    post 'customer_phones', to: "admin/customers#add_phone"
    get "posts/drafts", to: "posts#drafts", as: "posts_drafts"
    get "posts/dashboard", to: "posts#dashboard", as: "posts_dashboard"
    resources :posts
  end

end
