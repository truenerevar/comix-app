class HeroesController < ApplicationController
		def show 
		@hero = Hero.find(params[:id])
		@universe = Universe.find(@hero.universe_id)
		@gifts = @hero.gifts.paginate(:page => params[:page], :per_page => 2)
		@gift = Gift.new
		# @gifts = Gift.all
	end

	def create
		@universe = Universe.find(params[:universe_id])
		@universe.heroes.create(hero_params)
		redirect_to universe_path(@universe)
	end

	def edit
		@hero = Hero.find(params[:id])
		@universe = Universe.find(@hero.universe_id)
	end	

	def update
		@hero = Hero.find(params[:id])
		@universe = Universe.find(@hero.universe_id)
		@universe.heroes.update(hero_params)
		redirect_to universe_path(@universe)	
	end

	def destroy
		@hero = Hero.find(params[:id]).destroy
		@universe = Universe.find(@hero.universe_id)
		redirect_to universe_path(@universe)	
	end

	private
	  def hero_params
	    params.require(:hero).permit(:name)
	end	
end
