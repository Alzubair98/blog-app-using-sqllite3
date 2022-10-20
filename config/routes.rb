Rails.application.routes.draw do
  resources :articles #this will give us all the routes for articles
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  
  
end
