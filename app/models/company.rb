class Company < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	attr_accessible :name, :email, :cnpj, :phone, :andress, :password, :access_token

    validates_presence_of :email
    validates_uniqueness_of :email

end
