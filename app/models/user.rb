class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   devise :omniauthable,  omniauth_providers: [:facebook,  :google_oauth2]     
   has_many :questions 
   has_many :comments  

   def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        access_token.provider = "Google"
        user = User.create!(email: data["email"],
        provider:access_token.provider,
        email: data["email"],
        uid: access_token.uid,
        password: Devise.friendly_token[0,20],
        )
     end    
    end
   end


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
      user = User.create!(first_name: auth.extra.raw_info.first_name,
      last_name:auth.extra.raw_info.last_name,
      provider:auth.provider,
      email:auth.info.email,
      password:Devise.friendly_token[0,20],
      confirmed_at:Time.zone.now 
     )
     end
   end
end

   
   # def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
   #  user = User.where(provider: auth.provider, uid: auth.uid).first
   #  return user if user

   #  new_user = User.create do |u| 
   #    u.provider = 'facebook'
   #    u.uid = auth.uid
   #    u.email = auth.info.email
   #    u.password = Devise.friendly_token[0,20]
   #    u.admin = false
   #  end

    
   # end





end
