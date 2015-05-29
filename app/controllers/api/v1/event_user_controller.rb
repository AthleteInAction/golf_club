module Api
  module V1
  	class EventUserController < ApplicationController

      before_action :set_event_user, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = Tools.query params
        
        @event_users = EventUser.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

        respond_with @event_users,
        root: :event_users,
        meta: {
          current_page: @event_users.current_page,
          next_page: @event_users.next_page,
          prev_page: @event_users.prev_page,
          total_pages: @event_users.total_pages,
          total_count: @event_users.total_count,
          limit: (params[:limit].to_i || 100).to_i
        }

  		end
  		# =================================================
  		# =================================================


      # AVAILABLE
      # =================================================
      # =================================================
      def available

        # sleep 1

        q = <<-SQL
          SELECT u.* FROM users u
          JOIN event_users e ON e.user_id = u.id
          WHERE
          NOT EXISTS (
            SELECT null from teetimes t
            WHERE t.golfer_id = u.id AND t.round_id = #{params[:round_id]}
          )
          AND e.event_id = #{params[:event_id]}
        SQL

        q << "\nAND (u.name LIKE '%#{params[:value]}%' OR u.email LIKE '%#{params[:value]}%')" if params[:value].present?
        q << "\nLIMIT #{params[:limit] || 8}"

        @eu = User.find_by_sql q

        render json: @eu,root: :users

      end
      # =================================================
      # =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @event_user

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @event_user.update(event_user_params)

          render json: @event_user,status: :ok

        else

          render json: {error: true,errors: @event_user.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@event_user = Event_user.new event_user_params

  			if @event_user.save

  				render json: @event_user,status: :created

  			else

  				render json: {error: true,errors: @event_user.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @event_user.destroy

          render json: {event_user: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @event_user.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_event_user
        @event_user = Event_user.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def event_user_params
        params.require(:event_user).permit plist
      end

      def plist
        [:event_id,:user_id, :created_at, :updated_at]
      end

  	end
  end
end