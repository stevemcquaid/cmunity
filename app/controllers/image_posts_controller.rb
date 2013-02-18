class ImagePostsController < ApplicationController
  # GET /image_posts
  # GET /image_posts.json
  def index
    @image_posts = ImagePost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @image_posts }
    end
  end

  # GET /image_posts/1
  # GET /image_posts/1.json
  def show
    @image_post = ImagePost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image_post }
    end
  end

  # GET /image_posts/new
  # GET /image_posts/new.json
  def new
    @image_post = ImagePost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image_post }
    end
  end

  # GET /image_posts/1/edit
  def edit
    @image_post = ImagePost.find(params[:id])
  end

  # POST /image_posts
  # POST /image_posts.json
  def create
    @image_post = ImagePost.new(params[:image_post])

    respond_to do |format|
      if @image_post.save
        format.html { redirect_to @image_post, notice: 'Image post was successfully created.' }
        format.json { render json: @image_post, status: :created, location: @image_post }
      else
        format.html { render action: "new" }
        format.json { render json: @image_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /image_posts/1
  # PUT /image_posts/1.json
  def update
    @image_post = ImagePost.find(params[:id])

    respond_to do |format|
      if @image_post.update_attributes(params[:image_post])
        format.html { redirect_to @image_post, notice: 'Image post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_posts/1
  # DELETE /image_posts/1.json
  def destroy
    @image_post = ImagePost.find(params[:id])
    @image_post.destroy

    respond_to do |format|
      format.html { redirect_to image_posts_url }
      format.json { head :no_content }
    end
  end
end
