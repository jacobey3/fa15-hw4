class DogsController < ApplicationController

	def index
		@dogs = Dog.all
	end

	def new
		@dog = Dog.new
	end

	def create
		@dog = Dog.create(dog_params)
		if @dog.save
			redirect_to @dog
		else
			render "new"
		end
	end

	def show
		@dog = Dog.find(params[:id])
	end
	
	def dog_params
    params.require(:dog).permit(:name, :age) # Hash value with name and age from params dog.  STRONG PARAMS!
  end

end
