class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
		respond_to do |format|
			format.html
			format.json { render :json => @kittens }
		end
	end

	def show
		@kitten  = Kitten.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render :json => @kitten }
		end
	end

	def new
		@kitten  = Kitten.new
	end

	def create
		@kitten  = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success] = "Kitten succesfully created"
			redirect_to @kitten
		else
			render inline: "<h1>oh no</h1>"
		end
	end

	def edit
		@kitten  = Kitten.find(params[:id])
	end

	def update
		@kitten  = Kitten.find(params[:id])
		if @kitten.update(kitten_params)
			flash[:success] = "Kitten succesfully edited"
			redirect_to @kitten
		else
			render :edit
		end
	end

	def destroy
		@kitten  = Kitten.find(params[:id])
		@kitten.delete
		flash[:success] = "Kitten succesfully killed"
		redirect_to kittens_path
	end

	private
		def kitten_params
			params.require(:kitten).permit(:name, :age, :cuteness, :softness)
		end
end
