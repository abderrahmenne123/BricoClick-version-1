Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/show'
 # get 'users/edit'
 devise_for :users
 resources :users, only: [:index, :show, :edit, :update]
  
  root 'home#index'
  get 'home/private'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
