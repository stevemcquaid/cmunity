class VideoPostsController < ApplicationController
  # GET /video_posts
  # GET /video_posts.json
  def index
    @video_posts = VideoPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video_posts }
    end
  end

  # GET /video_posts/1
  # GET /video_posts/1.json
  def show
    @video_post = VideoPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video_post }
    end
  end

  # GET /video_posts/new
  # GET /video_posts/new.json
  def new
    @video_post = VideoPost.new
    @video_post.build_content
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video_post }
    end
  end

  # GET /video_posts/1/edit
  def edit
    @video_post = VideoPost.find(params[:id])
  end

  # POST /video_posts
  # POST /video_posts.json
  def create
    @video_post = VideoPost.new(params[:video_post])
    respond_to do |format|
      if @video_post.save
        @content = Content.new
        @content.media = @video_post
        @content.creator_id = current_user
        format.html { redirect_to @video_post, notice: 'Video post was successfully created.' }
        format.json { render json: @video_post, status: :created, location: @video_post }
      else
        format.html { render action: "new" }
        format.json { render json: @video_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /video_posts/1
  # PUT /video_posts/1.json
  def update
    @video_post = VideoPost.find(params[:id])

    respond_to do |format|
      if @video_post.update_attributes(params[:video_post])
        format.html { redirect_to @video_post, notice: 'Video post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_posts/1
  # DELETE /video_posts/1.json
  def destroy
    @video_post = VideoPost.find(params[:id])
    @video_post.destroy

    respond_to do |format|
      format.html { redirect_to video_posts_url }
      format.json { head :no_content }
    end
  end
end
