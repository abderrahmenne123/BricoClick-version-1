class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_secure_password
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :avatar
  has_one :jobprofile
def full_name
 "#{firstname} #{lastname}"
          
 end

     before_save do
       self.role.gsub!(/[\[\]\""]/,"") if attribute_present?("role")
     end   
  def self.search(search)
    if search
      where(["firstname LIKE ?","%#{search}%"])
    else
      all
    end

  end
  has_many :demandes
end
