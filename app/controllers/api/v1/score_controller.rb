module Api
  module V1
  	class ScoreController < ApplicationController

      before_action :set_score, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

#         select SUM(scores.score) as score,SUM(scores.par) as par,(SUM(score)-SUM(scores.par)) as to_par,users.* from scores
# JOIN users ON users.id = scores.golfer_id
# group by users.id
# order by to_par ASC

        q = Tools.query params
        
        @scores = Score.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

        to_par = 0
        total = 0
        thru = 0
        @scores.each do |score|

          to_par += score.score.to_i - score.par.to_i
          total += score.score.to_i
          thru = score.hole.to_i if score.hole.to_i > thru

        end

        respond_with @scores,
        root: :scores,
        meta: {
          current_page: @scores.current_page,
          next_page: @scores.next_page,
          prev_page: @scores.prev_page,
          total_pages: @scores.total_pages,
          total_count: @scores.total_count,
          limit: (params[:limit].to_i || 100).to_i,
          to_par: to_par,
          total: total,
          thru: thru
        }

  		end
  		# =================================================
  		# =================================================


      def leaderboard

        q = <<-SQL
        select 
          SUM(scores.score) as score,
          SUM(scores.par) as par,
          (SUM(score)-SUM(scores.par)) as to_par,
          COUNT(scores.id) as thru,
          users.id,users.name,users.email from scores
        JOIN users ON users.id = scores.golfer_id
        where scores.event_id = #{params[:event_id]}
        group by users.id
        order by to_par ASC,thru DESC
        SQL

        @leaderboard = Score.find_by_sql q

        render json: {leaderboard: @leaderboard},serializer: false

      end


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @score

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @score.update(score_params)

          render json: @score,status: :ok

        else

          render json: {error: true,errors: @score.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@score = Score.new score_params
        @score.user_id = current_user.id

  			if @score.save

  				render json: @score,status: :created

  			else

  				render json: {error: true,errors: @score.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @score.destroy

          render json: {score: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @score.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_score
        @score = Score.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def score_params
        params.require(:score).permit plist
      end

      def plist
        [:event_id,:course_id,:round_id,:teetime_id,:golfer_id,:hole,:yards,:par,:handicap,:score,:created_at,:updated_at]
      end

  	end
  end
end