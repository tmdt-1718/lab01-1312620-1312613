Rails.application.routes.draw do
  get 'blog/index'

  # Authentication
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # User
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
