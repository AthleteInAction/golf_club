module Api
  module V1
  	class TeetimeController < ApplicationController

      before_action :set_teetime, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = Tools.query params

        @teetimes = Teetime.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

        respond_with @teetimes,
        root: :teetimes,
        meta: {
          current_page: @teetimes.current_page,
          next_page: @teetimes.next_page,
          prev_page: @teetimes.prev_page,
          total_pages: @teetimes.total_pages,
          total_count: @teetimes.total_count,
          limit: (params[:limit].to_i || 100).to_i
        }

  		end
  		# =================================================
  		# =================================================


      # SCORECARD
      # =================================================
      # =================================================
      def scorecard

        teetime_id = params.require :teetime_id

        @scorecard = Score.where(teetime_id: teetime_id).order(:hole)



        render json: @scorecard,root: :scorecard

      end
      # =================================================
      # =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @teetime

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @teetime.update(teetime_params)

          render json: @teetime,status: :ok

        else

          render json: {error: true,errors: @teetime.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@teetime = Teetime.new teetime_params

  			if @teetime.save

  				render json: @teetime,status: :created

  			else

  				render json: {error: true,errors: @teetime.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @teetime.destroy

          render json: {teetime: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @teetime.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_teetime
        @teetime = Teetime.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def teetime_params
        params.require(:teetime).permit plist
      end

      def plist
        [:manual, :user_id, :event_id, :round_id, :course_id, :golfer_id, :teetime, :created_at, :updated_at]
      end

  	end
  end
end