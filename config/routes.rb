Rails.application.routes.draw do
  resources :articles, only: [:show, :index]
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  #this will give us all the routes for articles
  
end
