class HomeController < ApplicationController
  def index
   # redirect_to (:controller => 'home', :action => 'private')
   
  end

  def private
   # resources :users, only: [:new, :index, :show, :edit, :update, :destroy]
   #redirect_to (:controller => 'home', :action =>'home')
  end
end
