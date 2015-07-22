Rails.application.routes.draw do
  resources :users

  resources :projects do
  	resources :pledges
  end

  root "projects#index"
  	resources :projects
end