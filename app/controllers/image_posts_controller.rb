class ImagePostsController < ApplicationController



  def index
    @images = ImagePost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = ImagePost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = ImagePost.new
    @image.build_content
    @image.content.mediable = @image
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = ImagePost.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @image = ImagePost.new(params[:image_post])
    @image.content.creator = current_user
    respond_to do |format|
      if @image.save
        track_activity @image
        format.html { redirect_to post_path(@image.content), notice: 'Image post was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = ImagePost.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:imagest_po])
        track_activity @image
        format.html { redirect_to @image, notice: 'Image post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = ImagePost.find(params[:id])
    @image.destroy
    track_activity @image
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  def fetchimg
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
