class ScorecardTemplateSerializer < ActiveModel::Serializer
  
  attributes :id, :user_id, :course_id, :tee, :holes, :slope, :rating, :pars, :yards, :handicaps

  def pars

  	object.pars.split(',')

  end

  def yards

  	object.yards.split(',')

  end

  def handicaps

  	object.handicaps.split(',')

  end

end