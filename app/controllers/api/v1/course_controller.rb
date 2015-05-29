module Api
  module V1
  	class CourseController < ApplicationController

      before_action :set_course, only: [:show, :update, :destroy]
      before_action :artificial_sleep if E.development?

  		respond_to :json

  		# GET
  		# =================================================
  		# =================================================
  		def index

        q = Tools.query params
        
        @courses = Course.where(q)
        .page(params[:page])
        .per((params[:limit] || 100).to_i)
        .order(params[:order])

        respond_with @courses,
        root: :courses,
        meta: {
          current_page: @courses.current_page,
          next_page: @courses.next_page,
          prev_page: @courses.prev_page,
          total_pages: @courses.total_pages,
          total_count: @courses.total_count,
          limit: (params[:limit].to_i || 100).to_i
        }

  		end
  		# =================================================
  		# =================================================


  		# GET
  		# =================================================
  		# =================================================
  		def show

  			respond_with @course

  		end
  		# =================================================
  		# =================================================


  		# PUT
  		# =================================================
  		# =================================================
  		def update

        if @course.update(course_params)

          render json: @course,status: :ok

        else

          render json: {error: true,errors: @course.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================


  		# POST
  		# =================================================
  		# =================================================
  		def create

  			@course = Course.new course_params

  			if @course.save

  				render json: @course,status: :created

  			else

  				render json: {error: true,errors: @course.errors},status: :unprocessable_entity

  			end

  		end
  		# =================================================
  		# =================================================


  		# DELETE
  		# =================================================
  		# =================================================
  		def destroy

        if @course.destroy

          render json: {course: {id: params[:id].to_i}},status: :ok

        else

          render json: {error: true,errors: @course.errors},status: :unprocessable_entity

        end

  		end
  		# =================================================
  		# =================================================

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_course
        @course = Course.find params[:id]
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def course_params
        params.require(:course).permit plist
      end

      def plist
        [:user_id, :name, :address, :city, :state, :country, :zip, :created_at, :updated_at]
      end

      def artificial_sleep
         sleep 0.2 
      end

  	end
  end
end