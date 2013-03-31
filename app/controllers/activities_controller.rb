class ActivitiesController < ApplicationController

	def track_activity(trackable, action = params[:action])
		current_user.activities.create! action: action, trackable: trackable
	end

end
