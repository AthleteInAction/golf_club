class MyValidator < ActiveModel::Validator
  
  def validate record

  	par_length = record.pars.split(',').count
  	par_total = record.pars.gsub(',','')

  	unless par_length == record.holes.to_i && par_total =~ /^\d{1,}$/
  		record.errors[:pars] << 'are invalid'
  	end

  	yards_length = record.yards.split(',').count
  	yards_total = record.yards.gsub(',','')

  	unless yards_length == record.holes.to_i && yards_total =~ /^\d{1,}$/
  		record.errors[:yards] << 'are invalid'
  	end

  	handicaps_length = record.handicaps.split(',').count
  	handicaps_total = record.handicaps.gsub(',','')

  	unless handicaps_length == record.holes.to_i && handicaps_total =~ /^\d{1,}$/
  		record.errors[:handicaps] << 'are invalid'
  	end

  end

end

class ScorecardTemplate < ActiveRecord::Base
	
	include ActiveModel::Validations
	validates_presence_of :user_id,:course_id,:holes,:tee,:slope,:rating
	validates_with MyValidator

	protected
	def parValidate

		pars = self.pars.split(',')
		return false if pars.count != 18

		true

	end

end