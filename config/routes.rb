Rails.application.routes.draw do
  get 'top/main'
  get 'top/login'
  get 'top/logout'
  get 'top/failed'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'top/main'
  post 'top/login'
  post 'top/logout'
  root 'top#main'
  # Defines the root path route ("/")
  # root "articles#index"
end
