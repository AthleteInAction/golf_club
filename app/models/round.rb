class Round < ActiveRecord::Base
	belongs_to :course
	belongs_to :events
	belongs_to :scorecard,class_name: 'ScorecardTemplate',foreign_key: :scorecard_id
	validates_presence_of :user_id,:event_id,:course_id,:start_date
end