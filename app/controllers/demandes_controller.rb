class DemandesController < ApplicationController

    before_action :find_conversation 
  
    def index
      @demandes = @conversatdemande.demandes.order('created_at DESC')
  
      if @demandes.length > 10
        @over_ten = true
        @demandes = @demandes[-10..-1]
      end
  
      if params[:m]
        @over_ten = false
        @demandes = @conversatdemande.demandes
      end
  
      @demande = @conversatdemande.demandes.new
    end
  
    def create
      @demande = @conversatdemande.demandes.new(message_params)
      if @demande.save
        redirect_to conversatdemande_demandes_path(@conversatdemande)
      end
    end
  
    def new
      @demande = @conversatdemande.demandes.new
    end
    def edit
      @demande= Demande.find(params[:demande_id])
      @demande.update_attributes(:status => "refuser")
      redirect_to conversatdemande_demandes_path(@conversatdemande)
    end
      def rejeter
     # @demande= Demande.find(params[:demande_id])
      #@demande.update_attributes(:status => "refuser")
      #redirect_to conversatdemande_demandes_path(@conversatdemande)
      @demandes = Demande.where(:status => "acceptee").order('created_at DESC')
      @users = User.all
      redirect_to conversatdemande_demandes_path(@conversatdemande)
    end
    



    def listerefuser
      
          @demandes = Demande.where(:status => "acceptee").order('created_at DESC')
          @users = User.all
          redirect_to conversatdemande_demandes_path(@conversatdemande)
    
   end




    private
    
    
      def message_params
        params.require(:demande).permit(:body, :user_id,:status)
        #Ex:- :default =>'')
      end
  
      def find_conversation
        @conversatdemande = Conversatdemande.find(params[:conversatdemande_id])
      end
      
end
