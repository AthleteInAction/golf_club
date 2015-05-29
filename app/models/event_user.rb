class EventUser < ActiveRecord::Base

	belongs_to :user
	
	validates_presence_of :event_id,:user_id
	validates_uniqueness_of :event_id,scope: :user_id

end