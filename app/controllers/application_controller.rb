class ApplicationController < ActionController::Base
	protect_from_forgery

	def track_activity(trackable, action = params[:action])
		current_user.activities.create! action: action, trackable: trackable
	end

	rescue_from CanCan::AccessDenied do |exception|
    	if current_user.nil?
      		session[:next] = request.fullpath
      		puts session[:next]
      		redirect_to login_url, :alert => "You have to log in to continue."
    	else
      	#render :file => "#{Rails.root}/public/403.html", :status => 403
      		if request.env["HTTP_REFERER"].present?
       			redirect_to :back, :alert => exception.message
      		else
        		redirect_to root_url, :alert => exception.message
      		end
    	end
	end

end
