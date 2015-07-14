class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   devise :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]
  
   has_many :questions 
   has_many :comments



def self.find_for_facebook_oauth(auth, signed_in_resource = nil)  
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
     return user
    else 
     registered_user = User.where(:email => auth.info.email).first
    if registered_user
     return registered_user
    else
      auth.provider = "Facebook"
      user = User.create!(
      provider:auth.provider,
      email:auth.info.email,
      password:Devise.friendly_token[0,20],
      )
    end
  end
end

def self.find_for_google_oauth2(access_token, signed_in_resource = nil)
      # data = access_token.info
      user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
      binding.pry
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
      return registered_user
    else
      access_token.provider = "Google"
      user = User.create(first_name: data[“first_name”],
      last_name: data[“last_name”],
      provider:access_token.provider,
      email: data[“email”],
      password: Devise.friendly_token[0,20],
      confirmed_at:Time.zone.now # if u don’t want to send any confirmation mail
      )
    end
   end
  end

 # ******code needed for the username choice *******

#   attr_accessor :username
  

#  def self.find_first_by_auth_conditions(warden_conditions)
#   conditions = warden_conditions.dup
#   binding.pry
#   if login = conditions.delete(:login)
#     where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => username.downcase }]).first
#   else
#     if conditions[:username].nil?
#       where(conditions.to_hash).first
#     else
#       where(username: conditions[:username].to_hash).first
#     end
#   end
# end


   
 end