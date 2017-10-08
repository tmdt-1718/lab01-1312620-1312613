Rails.application.routes.draw do
  # Home
  get 'home' => 'home#index'

  # Authentication
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # User
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  # Blogs
  resources :blogs

  # Abouts
  get 'about' => 'abouts#index'

  root 'home#index'
end
