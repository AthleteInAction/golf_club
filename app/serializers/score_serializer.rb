class ScoreSerializer < ActiveModel::Serializer

	attributes :id,:user_id,:event_id,:course_id,:round_id,:teetime_id,:golfer_id,:hole,:par,:yards,:handicap,:score,:created_at,:updated_at

end