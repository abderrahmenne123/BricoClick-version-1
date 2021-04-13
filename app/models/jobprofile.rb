class Jobprofile < ActiveRecord::Base
    belongs_to :user 
    #has_many :user
    has_many_attached :gallery
    def thumbnail 
        return self.gallery.variant(resize: '300x300').processed

    end
    def self.search(search)
        if search
          where(["adresse LIKE ? or ville LIKE ? or tarif  LIKE ?","%#{search}%","%#{search}%","%#{search}%"])
        else
          all
        end
    
      end
end
