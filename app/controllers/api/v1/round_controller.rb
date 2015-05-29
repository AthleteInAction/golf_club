module Api
  module V1
  	class RoundController < ApplicationController

      before_action :set_round, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = Tools.query params
        
        @rounds = Round.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

        respond_with @rounds,
        root: :rounds,
        meta: {
          current_page: @rounds.current_page,
          next_page: @rounds.next_page,
          prev_page: @rounds.prev_page,
          total_pages: @rounds.total_pages,
          total_count: @rounds.total_count,
          limit: (params[:limit].to_i || 100).to_i
        }

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @round

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @round.update(round_params)

          render json: @round,status: :ok

        else

          render json: {error: true,errors: @round.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@round = Round.new round_params

  			if @round.save

  				render json: @round,status: :created

  			else

  				render json: {error: true,errors: @round.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @round.destroy

          render json: {round: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @round.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_round
        @round = Round.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def round_params
        params.require(:round).permit plist
      end

      def plist
        [:scorecard_id, :user_id, :event_id, :course_id, :start_date, :created_at, :updated_at]
      end

  	end
  end
end