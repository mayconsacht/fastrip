class UserRequest < ActiveRecord::Base
	belongs_to :trip
	belongs_to :user
end