Rails.application.routes.draw do

  root 'welcome#index'
  get '/profile', to: 'users#show'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :tasks

end
