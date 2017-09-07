Rails.application.routes.draw do
	resources :kittens

	get '/sidebar', to: 'static_pages#sidebar'
	get '/form'		, to: 'static_pages#form'


	root 'static_pages#index'
end
