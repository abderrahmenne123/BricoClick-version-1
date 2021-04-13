Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/show'
 # get 'users/edit'
 #devise_for :users
 #resources :users, only: [:new, :index, :show, :edit, :update, :destroy]
 #resources :admin, only: [:index, :show, :edit, :update]
 root  'home#index'
 devise_for :users
 resources :conversations do
  resources :messages 
  
 end
 resources :conversatdemandes do
 resources :demandes do
  # get '/' , to:'demandes#rejeter'
   get '/demandesrejeter' , to: 'demandes#listerefuser'
 end

 end
 namespace :api, defaults: {format: 'json'} do
  namespace :v1 do
    
    
      resources :jobs
      resources :jobprofiles
      devise_scope :user do
        post "/sign_in", :to => 'sessions#create'
        post "/sign_up", :to => 'registrations#create'
        delete "/sign_out", :to => 'sessions#destroy'
      end
  end
end
resources :users, only: [:new, :index, :show, :edit, :update, :destroy] do
 #get '/private', to: 'home#private'
 end
 resources :jobs
 resources :jobprofiles
# root to: 'home#index'
 #get '/demandeparuser' , to: 'demandes#demandeparuser'
  get 'home/private'
  get 'errors/404', to: 'errors#not_found'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
