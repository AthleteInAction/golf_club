class EventUserSerializer < ActiveModel::Serializer
	has_one :user,key: :user_id
	attributes :id, :user_id, :event_id, :created_at, :updated_at
end