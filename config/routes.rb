Rails.application.routes.draw do
  get 'top/main'
  get 'top/login'
  get 'top/logout'
  get 'top/failed'
  get 'top/signin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'top/main'
  post 'top/login'
  post 'top/logout'
  post 'top/signin'
  root 'top#main'
  # Defines the root path route ("/")
  # root "articles#index"
end
