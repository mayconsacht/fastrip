class UserRequest < ActiveRecord::Base
	belongs_to :trip
	belongs_to :user

	def self.update_status
	    @requests = UserRequest.where("trip_out_date < ? and status = ?", Date.current, 'Confirmado')
	    @requests.each do |request|
	    	@requests.update(request, status: 'Realizado')
	    end
	end
end