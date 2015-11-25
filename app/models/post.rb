class Post < ActiveRecord::Base
	belongs_to :trip

	validates_presence_of :opinion_local, :opinion_best, :opinion_worst
end
