class User < ActiveRecord::Base

    has_many :trips
    has_many :user_requests
    has_many :company, :through => :trips
    
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
    :omniauth_providers => [:facebook]

    attr_accessible :name, :email, :cpf, :phone, :andress, :password, :password_confirmation, :oauth_token, :token_secret, :access_token, :uid, :photo_url, :provider

    validates_presence_of :email
    validates_uniqueness_of :email

    def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
        user = User.where(:provider => auth.provider, :uid => auth.uid).first
        byebug
        if user
          return user
        else
          registered_user = User.where(:email => auth.info.email).first
          if registered_user
            return registered_user
          else
            user = User.create(name: auth.info.name,
                               provider: auth.provider,
                               uid: auth.uid,
                               email: auth.info.email,
                               photo_url: auth.info.image,
                               oauth_token: auth.credentials.token,
                               token_secret: auth.credentials.secret,
                               password: Devise.friendly_token[0,20],
                              )
          end
        end
    end
end