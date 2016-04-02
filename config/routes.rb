Rails.application.routes.draw do

  root 'welcome#index'
  get '/profile', to: 'users#show'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :tasks
  put 'tasks/status/:id', to: 'tasks#update_status', as: :update_status

end
