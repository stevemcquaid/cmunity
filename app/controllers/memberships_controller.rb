class MembershipsController < ApplicationController

	def create
		@membership = current_user.memberships.build(:group_id => params[:group_id])
		respond_to do |format|
			if @membership.save
				track_activity @membership
  				format.js
  			end
		end
	end

	def destroy
		member = Membership.where("user_id = ? AND group_id = ?", current_user, params[:group_id]).last
		@membership = Membership.destroy(member)
		respond_to do |format|
			track_activity @membership
	  		format.js
		end
	end


end
