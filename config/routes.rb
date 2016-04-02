Rails.application.routes.draw do

  root 'welcome#index'
  get '/profile', to: 'users#show'

  devise_for :users, controllers: { registrations: 'registrations' }

  put '/tasks/status/:id', to: 'tasks#update_status', as: :update_status
  get '/tasks/archived', to: 'tasks#archive', as: :view_archived_tasks

  resources :tasks



end
