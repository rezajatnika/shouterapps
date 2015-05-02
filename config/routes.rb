Rails.application.routes.draw do
  # Root path
  root 'pages#home'

  # Static pages
  get 'about'   => 'pages#about'
  get 'help'    => 'pages#help'
  get 'contact' => 'pages#contact'

  # Register path
  get 'register' => 'users#new'
end
