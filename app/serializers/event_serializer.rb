class EventSerializer < ActiveModel::Serializer
	has_many :rounds
	attributes :id, :user_id, :title, :description, :start_date, :end_date, :created_at, :updated_at
end