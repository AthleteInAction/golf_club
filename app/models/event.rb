class Event < ActiveRecord::Base

	def to_param
		"#{id} #{title} #{start_date.strftime('%b %-d %Y')}".parameterize
	end
	
	has_many :rounds

	validates_presence_of :user_id,:course_id,:title,:description,:start_date

end