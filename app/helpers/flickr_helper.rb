module FlickrHelper
	def user_photos(user_id, photo_count = 12)
		data = YAML.load_file("config/flickr.yml")
		FlickRaw.api_key 			 = data["key"]
		FlickRaw.shared_secret = data["secret"]
		flickr.photos.search(:user_id => user_id).first(photo_count)
	end

	def get_url(photo)
		FlickRaw.url(flickr.photos.getInfo(:photo_id => photo.id))
	end

	def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
		begin
			photos = user_photos(user_id, photo_count).in_groups_of(columns)
			render :partial => '/flickr/sidebar_widget', :locals => { :photos => photos }
		rescue Exception
			render :partial => '/flickr/unavailable'
		end
	end

end