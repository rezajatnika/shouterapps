Rails.application.routes.draw do
  # Root path
  root 'pages#home'

  # Static pages
  get 'about'   => 'pages#about'
  get 'help'    => 'pages#help'
  get 'contact' => 'pages#contact'

  # Check user email
  get 'users/check_email', defaults: { format: 'json' }

  # Register path
  get 'register' => 'users#new'

  # Resources
  resources :users
end
