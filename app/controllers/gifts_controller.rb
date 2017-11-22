class GiftsController < ApplicationController
		def show 
		@gift = Gift.find(params[:id])
		@hero = Hero.find(@gift.hero_id)
		@skills = @gift.skills.paginate(:page => params[:page], :per_page => 2)
		@skill = Skill.new
		# @skills = Skill.all
	end

	def create
		@hero = Hero.find(params[:hero_id])
		@hero.gifts.create(gift_params)
		redirect_to hero_path(@hero)
	end

	def edit
		@gift = Gift.find(params[:id])
		@hero = Hero.find(@gift.hero_id)
	end	

	def update
		@gift = Gift.find(params[:id])
		@hero = Hero.find(@gift.hero_id)
		@hero.gifts.update(gift_params)
		redirect_to hero_path(@hero)	
	end

	def destroy
		@gift = Gift.find(params[:id]).destroy
		@hero = Hero.find(@gift.hero_id)
		redirect_to hero_path(@hero)	
	end

	private
	  def gift_params
	    params.require(:gift).permit(:name)
	end	
end
