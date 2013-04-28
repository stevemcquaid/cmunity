class VideoPostsController < ApplicationController

  def index
    @videos = VideoPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = VideoPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = VideoPost.new
    @video.build_content
    @video.content.mediable = @video
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = VideoPost.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = VideoPost.new(params[:video_post])
    @video.content.creator = current_user
    respond_to do |format|
      if @video.save
        track_activity @video
        format.html { redirect_to post_path(@video.content), notice: 'Video post was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = VideoPost.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video_post])
        track_activity @video
        format.html { redirect_to @video, notice: 'Video post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = VideoPost.find(params[:id])
    @video.destroy
    track_activity @video
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  def fetchvid
    require 'opengraph'

    url = params[:url].html_safe
    @data = OpenGraph.fetch(url)
    if @data == false
      doc = Nokogiri::HTML(open(url))
      @data.title = doc.css('title')
    end
    respond_to do |format|
      format.json { render :json => @data }
    end
  end

end
