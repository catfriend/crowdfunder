Rails.application.routes.draw do
  get 'signup' => 'users#new'
  
  resources :users

  resources :projects do
  	resources :pledges
  end

  root "projects#index"
  	resources :projects
end