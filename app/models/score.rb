class Score < ActiveRecord::Base

	validates_presence_of :user_id,:event_id,:course_id,:round_id,:teetime_id,:golfer_id,:hole,:par,:yards,:handicap,:score
	validates_uniqueness_of :hole,scope: :teetime_id

end