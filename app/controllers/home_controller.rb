class HomeController < ApplicationController
  # Want to show all the posts of all types on the homepage for MVP
  def index
    @contents = Content.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end
  
end
