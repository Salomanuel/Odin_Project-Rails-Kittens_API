class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
	end

	def show
		@kitten  = Kitten.find(params[:id])
	end

	def new
		@kitten  = Kitten.new
		@scale   = (1..10).to_a.map { |i| [i, i] }
	end

	def create
		@kitten  = Kitten.new(kitten_params)
		if @kitten.save
			# render inline: "<h1>ok</h1>"
			redirect_to @kitten
		else
			render inline: "<h1>oh no</h1>"
		end
	end

	private
		def kitten_params
			params.require(:kitten).permit(:name, :age, :cuteness, :softness)
		end
end
