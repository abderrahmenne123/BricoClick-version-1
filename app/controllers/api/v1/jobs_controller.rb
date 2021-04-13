class API::V1::JobsController < ApplicationController
    def index
        @jobs = Job.all
      # render json: @jobs, status: :ok
      render json: {
        status: :ok,
        message:"liste des jobs",
        jobs: @jobs
      }
          
            # format.json { render :json =>  @jobs.to_json, :status => :ok }
       
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