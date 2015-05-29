class RoundSerializer < ActiveModel::Serializer
	has_one :course
	has_one :scorecard,key: :scorecard_id
	attributes :id, :scorecard_id, :user_id, :event_id, :course_id, :start_date, :created_at, :updated_at
end