Rails.application.routes.draw do


  get 'users/show'

  root 'welcome#index'

  devise_for :users
end
