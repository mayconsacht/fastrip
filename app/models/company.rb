class Company < ActiveRecord::Base

  	has_many :trips
  	has_many :users, :through => :trips

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	attr_accessible :points, :name, :email, :cnpj, :phone, :andress, :password, :access_token

    validates_presence_of :email
    validates_uniqueness_of :email

end
