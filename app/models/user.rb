class User < ActiveRecord::Base

    has_many :trips
    has_many :company, :through => :trips
    
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

    attr_accessible :name, :email, :cpf, :phone, :andress, :password, :access_token, :uid, :photo_url, :provider

    validates_presence_of :email
    validates_uniqueness_of :email

    def self.from_omniauth(auth)
    	where(auth.slice(:provider, :uid)).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
    		user.provider = auth.provider
    		user.uid = auth.uid
    		user.name = auth.info.name
    	end
    end

    def self.new_with_session(params, session)
    	if session["devise.user_attributes"]
    		new(session["devise.user_attributes"], without_protection: true) do |user|
    			user.attributes = params
    			user.valid?
    		end
    	else
    		super
    	end
    end

    def password_required?
    	super && provider.blank?
    end
end
