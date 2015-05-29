module Api
  module V1
  	class GenerateController < ApplicationController

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index



  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

        p = params.require(:generator).permit :round_id,:spacing,:per_group,:type,:override,:start_time

        @round = Round.find p[:round_id]

        # ALL MEMBERS REGISTERED TO EVENT, WITH TEETIME
        q = <<-SQL
          SELECT users.*,teetimes.manual FROM teetimes
          JOIN users ON users.id = teetimes.golfer_id
          WHERE teetimes.round_id = #{@round.id}
          UNION
          SELECT u.*,0 as manual FROM users u
          JOIN event_users e ON e.user_id = u.id
          WHERE
          NOT EXISTS (
            SELECT null from teetimes t
            WHERE t.golfer_id = u.id AND t.round_id = #{@round.id}
          )
          AND e.event_id = #{@round.event_id}
        SQL

        @eu = User.find_by_sql q
        eu = @eu.shuffle
        per_group = p[:per_group].to_i
        group = 0

        teetimes = []

        i = 0
        eu.each do |user|

          if user.manual == 0 || p[:override]

            start_time = Time.parse(p[:start_time])
            start_time = start_time+60*p[:spacing].to_i*group

            teetimes << {
              user_id: current_user.id,
              event_id: @round.event_id,
              course_id: @round.course_id,
              round_id: @round.id,
              golfer_id: user.id,
              teetime: start_time
            }

            i+=1
            if i >= per_group
              i = 0
              group += 1
            end

          end

        end

        Teetime.transaction do

          ct = {
            event_id: @round.event_id,
            round_id: @round.id,
            manual: false
          }

          ct.delete :manual if p[:override]

          Teetime.where(ct).destroy_all
          teetimes.each do |teetime|

            t = Teetime.new teetime
            t.save!

          end

        end

  			render json: {t: p}

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        

  		end
  		# =================================================
  		# =================================================

  	end
  end
end