Rails.application.routes.draw do
  resource :session

  get 'signin' => 'sessions#new'

  get 'signup' => 'users#new'

  resources :users

  resources :projects do
  	resources :pledges
  end

  root "projects#index"
  	resources :projects
end