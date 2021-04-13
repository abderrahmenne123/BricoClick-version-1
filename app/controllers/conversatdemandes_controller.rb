class ConversatdemandesController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @users = User.all
      @conversatdemandes = Conversatdemande.all
    end
  
    
    def create
      if Conversatdemande.between(params[:sender_id], params[:recipient_id]).present?
        @conversatdemande = Conversatdemande.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversatdemande = Conversatdemande.create!(conversation_params)
      end
      redirect_to conversatdemande_demandes_path(@conversatdemande)
    end
    


    private
      def conversation_params
        params.permit(:sender_id, :recipient_id)
      end
  
end

