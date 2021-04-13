class Demande < ActiveRecord::Base
    belongs_to :conversatdemande
    belongs_to :user
    validates_presence_of :body, :conversatdemande_id, :user_id
  
    
end
