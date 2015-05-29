class TeetimeSerializer < ActiveModel::Serializer

	has_one :golfer,key: :golfer_id

	has_many :scores

	attributes :id, :score, :thru, :to_par, :user_id, :event_id, :course_id, :golfer_id, :round_id, :teetime, :manual, :created_at, :updated_at

	def score

		total = 0

		self.scores.each do |score|

			total += score.score.to_i if score.score

		end

		total

	end

	def thru

		max = 0

		self.scores.each do |score|

			max = score.hole.to_i if score.hole.to_i && score.hole.to_i > max

		end

		max

	end

	def to_par

		par = 0

		self.scores.each do |score|

			par += score.score.to_i-score.par.to_i if score.score && score.par

		end

		# par = 'E' if par == 0

		par = '--' if self.thru == 0

		par

	end

end