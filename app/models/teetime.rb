class Teetime < ActiveRecord::Base

	belongs_to :golfer,class_name: 'User',foreign_key: :golfer_id

	has_many :scores

	validates_presence_of :user_id,:event_id,:round_id,:golfer_id

end