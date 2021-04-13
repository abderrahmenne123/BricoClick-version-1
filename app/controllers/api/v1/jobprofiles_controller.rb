class API::V1::JobprofilesController < ApplicationController
    def index
       # @jobprofiles = Jobprofile.all.paginate(page: params[:page], per_page: 3).search(params[:search])
       #render json:  @jobprofiles, status: :ok
          
            # format.json { render :json =>  @jobs.to_json, :status => :ok }
            @jobs = Jobprofile.all
            # render json: @jobs, status: :ok
            render json: {
              status: :ok,
              message:"liste des jobs",
              jobs: @jobs
            }
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