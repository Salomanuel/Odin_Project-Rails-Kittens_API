class StaticPagesController < ApplicationController
	def form
		if params[:name]
			@user   = params[:name]
			@photos = flickr.photos.search(:user_id => 'Salomanuel')
		end
	end
end
