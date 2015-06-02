module Api
  module V1
  	class InstagramController < ApplicationController

  		respond_to :json


  		# INDEX
  		# =================================================
  		# =================================================
  		def index

  			tag = params.require :tag

        @instagrams = Instagram.tag_recent_media tag,count: 100

        render json: @instagrams

      end
  		# =================================================
  		# =================================================


      # GET
      # =================================================
      # =================================================
      def show

        tag = params.require :id

        @instagrams = Instagram.tag_recent_media tag,count: 100

        render json: @instagrams

      end
      # =================================================
      # =================================================

  	end
  end
end