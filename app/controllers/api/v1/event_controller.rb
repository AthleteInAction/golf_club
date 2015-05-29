module Api
  module V1
  	class EventController < ApplicationController

      before_action :set_event, only: [:show, :update, :destroy]

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = Tools.query params
        
        @events = Event.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

        respond_with @events,
        root: :events,
        meta: {
          current_page: @events.current_page,
          next_page: @events.next_page,
          prev_page: @events.prev_page,
          total_pages: @events.total_pages,
          total_count: @events.total_count,
          limit: (params[:limit].to_i || 100).to_i
        }

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @event

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @event.update(event_params)

          render json: @event,status: :ok

        else

          render json: {error: true,errors: @event.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@event = Event.new event_params

  			if @event.save

  				render json: @event,status: :created

  			else

  				render json: {error: true,errors: @event.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @event.destroy

          render json: {event: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @event.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def event_params
        params.require(:event).permit plist
      end

      def plist
        [:course_id, :user_id, :title, :description, :start_date, :end_date]
      end

  	end
  end
end