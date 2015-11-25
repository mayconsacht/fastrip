class Company < ActiveRecord::Base

  	has_many :trips

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	attr_accessible :note_average, :name, :email, :cnpj, :phone, :andress, :password, :access_token

    validates_presence_of :email
    validates_uniqueness_of :email

end
