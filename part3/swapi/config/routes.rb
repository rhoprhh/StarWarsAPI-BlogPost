Rails.application.routes.draw do
  resources :characters
  resources :vehicles
  resources :starships
  resources :species
  resources :planets
  resources :films
  root 'home#index'
end
