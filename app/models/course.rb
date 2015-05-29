class Course < ActiveRecord::Base
	has_many :scorecard_templates
	validates_presence_of :name,:city,:state,:country
end