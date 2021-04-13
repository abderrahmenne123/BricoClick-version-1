class API::V1::UsersController < ApplicationController
    def index
        @users = User.first
        render json:  @users, status: :ok
        #byebug
    end
    def create

    end
    def update

    end
    def destroy

    end
    def show

    end
end
