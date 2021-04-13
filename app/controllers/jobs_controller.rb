class JobsController < ApplicationController
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    #authorize_resource
    def new
        @job = Job.new
      
    end
    
    
    def index
      #authorize_resource
     # authorize! :manage, :User
      
     
     @jobs = Job.all
        
      
      
    end
    
    def create
      @job = Job.new(user_params)
  
      respond_to do |format|
        if @job.save
          format.html { redirect_to @job, notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end
    def show
     @job = Job.find(params[:id])
    end
  
    def edit
     # @user = current_user
    end
    def update
      respond_to do |format|
      if @job.update(user_params)
        format.html{redirect_to @job, notice:'accepte modificate'}
      else
        format.html{ render :edit}
      end
     end
    end
    def destroy
      @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end
    private
  
    def set_job
      @job = Job.find(params[:id])
    end
    def user_params
      params.require(:job).permit(
        :name
        
      )
    end
 
end