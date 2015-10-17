class Trip < ActiveRecord::Base
	belongs_to :user
	belongs_to :company
	has_many   :posts

	scope :with_name, lambda {|parameter| where("name like ?", "%#{parameter}%")}
	scope :in_category, lambda {|parameter| where("category = ?", parameter)}
	scope :with_origin, lambda {|parameter| where("origin like ?", "%#{parameter}%")}
	scope :with_destination, lambda {|parameter| where("destination like ?", "%#{parameter}%")}
	scope :in_date, lambda {|parameter| where("in_date = ?", parameter)}
	scope :out_date, lambda {|parameter| where("out_date = ?", parameter)}

	def self.search(parameters)
		trips_query = self
		parameters.each do |parameter, value|
			if not value.empty? and trips_query.respond_to? parameter
				trips_query = trips_query.send(parameter, value)
			end
		end 
		trips_query
	end
end
