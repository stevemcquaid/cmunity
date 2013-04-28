class EventPostsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = EventPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = EventPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = EventPost.new
    @event.build_content
    @event.content.mediable = @event

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = EventPost.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = EventPost.new(params[:event_post])
    @event.content.creator= current_user

    respond_to do |format|
      if @event.save
        track_activity @event
        format.html { redirect_to post_path(@event.content), notice: 'Event post was successfully created.' }
        format.json { render json: post_path(@event.content), status: :created, location: post_path(@event.content) }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = EventPost.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event_post])
        track_activity @event
        format.html { redirect_to @event, notice: 'Event post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = EventPost.find(params[:id])
    @event.destroy
    track_activity @event
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
