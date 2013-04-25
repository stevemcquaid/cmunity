class EventPostsController < ApplicationController
  # GET /event_posts
  # GET /event_posts.json
  def index
    @event_posts = EventPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_posts }
    end
  end

  # GET /event_posts/1
  # GET /event_posts/1.json
  def show
    @event_post = EventPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_post }
    end
  end

  # GET /event_posts/new
  # GET /event_posts/new.json
  def new
    @event = EventPost.new
    @event.build_content
    @event.content.mediable = @event

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_post }
    end
  end

  # GET /event_posts/1/edit
  def edit
    @event_post = EventPost.find(params[:id])
  end

  # POST /event_posts
  # POST /event_posts.json
  def create
    @event_post = EventPost.new(params[:event_post])
    @event_post.content.media = @event_post
    @event_post.content.creator= current_user
    respond_to do |format|
      if @event_post.save
        track_activity @event_post
        format.html { redirect_to @event_post, notice: 'Event post was successfully created.' }
        format.json { render json: @event_post, status: :created, location: @event_post }
      else
        format.html { render action: "new" }
        format.json { render json: @event_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_posts/1
  # PUT /event_posts/1.json
  def update
    @event_post = EventPost.find(params[:id])

    respond_to do |format|
      if @event_post.update_attributes(params[:event_post])
        track_activity @event_post
        format.html { redirect_to @event_post, notice: 'Event post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_posts/1
  # DELETE /event_posts/1.json
  def destroy
    @event_post = EventPost.find(params[:id])
    @event_post.destroy
    track_activity @event_post
    respond_to do |format|
      format.html { redirect_to event_posts_url }
      format.json { head :no_content }
    end
  end
end
