Rails.application.routes.draw do
  get 'sessions/new'

  # Root path
  root 'pages#home'

  # Static pages
  get 'about'   => 'pages#about'
  get 'help'    => 'pages#help'
  get 'contact' => 'pages#contact'

  # Check user email
  get 'users/check_email', defaults: { format: 'json' }

  # Login/logout
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # Register path
  get 'register' => 'users#new'

  # Resources
  resources :users
end
