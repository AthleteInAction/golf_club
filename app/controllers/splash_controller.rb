class SplashController < ApplicationController

	skip_before_filter :authorize

	def index

		if current_user.nil?

			render layout: 'splash'

		else

			redirect_to dashboard_path

		end

	end

end