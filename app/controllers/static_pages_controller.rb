class StaticPagesController < ApplicationController
	include FlickrHelper
	def form
		if params[:name]
			@user   = params[:name]
		end
	end
end
