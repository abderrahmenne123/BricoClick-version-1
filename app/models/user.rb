class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
def full_name
 "#{firstname} #{lastname}"
          
 end
     before_save do
       self.role.gsub!(/[\[\]\""]/,"") if attribute_present?("role")
     end    
end
