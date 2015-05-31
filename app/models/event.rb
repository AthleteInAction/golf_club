class Event < ActiveRecord::Base
	
	has_many :rounds

	validates_presence_of :user_id,:course_id,:title,:description,:start_date

end