Rails.application.routes.draw do
  # Root path
  root 'pages#home'

  # Static pages
  get 'pages/about'
  get 'pages/help'
  get 'pages/contact'
end
