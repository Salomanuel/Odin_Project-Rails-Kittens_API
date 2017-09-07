class StaticPagesController < ApplicationController
	include FlickrHelper
	def form
		if params[:name]
			@user   = params[:name]
			@photos = user_photos(@user)
		end
	end
end
