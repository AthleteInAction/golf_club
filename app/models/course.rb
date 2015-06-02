class Course < ActiveRecord::Base

	def to_param
		"#{id} #{name}".parameterize
	end

	has_many :scorecard_templates

	validates_presence_of :name,:city,:state,:country
	
end