class CourseSerializer < ActiveModel::Serializer
	has_many :scorecard_templates
	attributes :id, :user_id, :name, :address, :city, :state, :country, :zip, :created_at, :updated_at
end