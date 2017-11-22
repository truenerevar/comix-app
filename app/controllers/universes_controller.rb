class UniversesController < ApplicationController
		def index 
		# @universes = Universe.all
		@universes = Universe.paginate(:page => params[:page], :per_page => 2)
		@universe = Universe.new
		@universe.avatar = params[:file]
	end

	def show 
		@universe = Universe.find(params[:id])
		# @heroes = Hero.all
		@hero = Hero.new
		@heroes = @universe.heroes.paginate(:page => params[:page], :per_page => 2)
	end

	def create
		Universe.create(universe_params)
		redirect_to universes_path
	end

	def edit
		@universe = Universe.find(params[:id])
	end	

	def update
		@universe = Universe.find(params[:id])
		@universe.update(universe_params)
		redirect_to universe_path
	end

	def destroy
		@universe = Universe.find(params[:id]).destroy
		redirect_to universes_path	
	end

	private
	  def universe_params
	    params.require(:universe).permit(:name, :avatar)
	end	
end
