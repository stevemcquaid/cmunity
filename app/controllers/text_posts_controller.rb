class TextPostsController < ApplicationController
  # GET /text_posts
  # GET /text_posts.json
  def index
    @text_posts = TextPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @text_posts }
    end
  end

  # GET /text_posts/1
  # GET /text_posts/1.json
  def show
    @text_post = TextPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text_post }
    end
  end

  # GET /text_posts/new
  # GET /text_posts/new.json
  def new
    @text = TextPost.new
    @text.build_content
    @text.content.mediable = @text

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text_post }
    end
  end

  # GET /text_posts/1/edit
  def edit
    @text_post = TextPost.find(params[:id])
  end

  # POST /text_posts
  # POST /text_posts.json
  def create
    @text = TextPost.new(params[:text_post])
    @text.content.creator = current_user
    respond_to do |format|
      if @text.save
        track_activity @text
        format.html { redirect_to texts_url, notice: 'Text post was successfully created.' }
        format.json { render json: @text, status: :created, location: @text }
      else
        format.html { render action: "new" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /text_posts/1
  # PUT /text_posts/1.json
  def update
    @text_post = TextPost.find(params[:id])

    respond_to do |format|
      if @text_post.update_attributes(params[:text_post])
        track_activity @text_post
        format.html { redirect_to @text_post, notice: 'Text post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_posts/1
  # DELETE /text_posts/1.json
  def destroy
    @text_post = TextPost.find(params[:id])
    @text_post.destroy
    track_activity @text_post
    respond_to do |format|
      format.html { redirect_to text_posts_url }
      format.json { head :no_content }
    end
  end
end
