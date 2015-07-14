class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
   devise :omniauthable,  omniauth_providers: [:facebook,  :google_oauth2]  
   validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
     
   has_many :questions 
   has_many :comments  
   attr_accessor :login

 def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  else
    if conditions[:username].nil?
      where(conditions).first
    else
      where(username: conditions[:username]).first
    end
  end
end




















  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.id).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     # user.name = auth.info.name
  #     # user.image =auth.info.image
  #   end
  # end

  def self.find_for_google_oauth2(access_token, signed_in_resource = nil)

    data = access_token.info

    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first

    if user

    return user

    else

    registered_user = User.where(:email => access_token.info.email).first

    if registered_user

    return registered_user

    else

    access_token.provider = “Google”

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


   # def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
   #  data = access_token.info
   #  user = User.where(:provider => access_token.provider, :uid => access_token.uid).first
   #  if user
   #    return user
   #  else
   #    registered_user = User.where(:email => access_token.info.email).first
   #    if registered_user
   #      return registered_user
   #    else
   #      access_token.provider = "Google"
   #      user = User.create!(email: data["email"],
   #      provider:access_token.provider,
   #      email: data["email"],
   #      uid: access_token.uid,
   #      password: Devise.friendly_token[0,20],
   #      )
   #   end    
   #  end
   # end

#      def self.new_with_session(params, session)
#     super.tap do |user|
#       if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
#         user.email = data["email"] if user.email.blank?
#       end
#     end
#   end
# end



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
      # confirmed_at:Time.zone.now 
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

    
   end





# end
