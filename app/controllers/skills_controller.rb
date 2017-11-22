class SkillsController < ApplicationController
		def show 
		@skill = Skill.find(params[:id])
		@gift = Gift.find(@skill.gift_id)
	end

	def create
		@gift = Gift.find(params[:gift_id])
		@gift.skills.create(skill_params)
		redirect_to gift_path(@gift)
	end

	def edit
		@skill = Skill.find(params[:id])
		@gift = Gift.find(@skill.gift_id)
	end	

	def update
		@skill = Skill.find(params[:id])
		@gift = Gift.find(@skill.gift_id)
		@gift.skills.update(skill_params)
		redirect_to gift_path(@gift)	
	end

	def destroy
		@skill = Skill.find(params[:id]).destroy
		@gift = Gift.find(@skill.gift_id)
		redirect_to gift_path(@gift)	
	end

	private
	  def skill_params
	    params.require(:skill).permit(:name)
	end	
end
