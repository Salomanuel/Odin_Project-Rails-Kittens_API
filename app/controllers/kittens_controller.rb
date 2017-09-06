class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
	end

	def show
		@kitten  = Kitten.find(params[:id])
	end

	def new
		@kitten  = Kitten.new
		@scale   = (1..10).to_a
	end

	def create
		@kitten  = Kitten.new(kitten_params)
		if @kitten.save
			redirect_to @kitten
		else
			render inline: "<h1>oh no</h1>"
		end
	end

	def edit
		@kitten  = Kitten.find(params[:id])
		@scale   = (1..10).to_a
	end

	def update
		@kitten  = Kitten.find(params[:id])
		if @kitten.update(kitten_params)
			redirect_to @kitten
		else
			render inline: "<h1>oh no</h1>"
		end
	end

	def destroy
		@kitten  = Kitten.find(params[:id])
		@kitten.delete
		redirect_to kittens_path
	end

	private
		def kitten_params
			params.require(:kitten).permit(:name, :age, :cuteness, :softness)
		end
end
