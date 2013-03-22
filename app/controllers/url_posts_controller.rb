class UrlPostsController < ApplicationController
  # GET /url_posts
  # GET /url_posts.json
  def index
    @url_posts = UrlPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @url_posts }
    end
  end

  # GET /url_posts/1
  # GET /url_posts/1.json
  def show
    @url_post = UrlPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @url_post }
    end
  end

  # GET /url_posts/new
  # GET /url_posts/new.json
  def new
    @url_post = UrlPost.new
    @url_post.build_content
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @url_post }
    end
  end

  # GET /url_posts/1/edit
  def edit
    @url_post = UrlPost.find(params[:id])
  end

  # POST /url_posts
  # POST /url_posts.json
  def create
    @url_post = UrlPost.new(params[:url_post])
    @url_post.content.media = @url_post
    @url_post.content.creator= current_user
    respond_to do |format|
      if @url_post.save
        format.html { redirect_to @url_post, notice: 'Url post was successfully created.' }
        format.json { render json: @url_post, status: :created, location: @url_post }
      else
        format.html { render action: "new" }
        format.json { render json: @url_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /url_posts/1
  # PUT /url_posts/1.json
  def update
    @url_post = UrlPost.find(params[:id])

    respond_to do |format|
      if @url_post.update_attributes(params[:url_post])
        format.html { redirect_to @url_post, notice: 'Url post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @url_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_posts/1
  # DELETE /url_posts/1.json
  def destroy
    @url_post = UrlPost.find(params[:id])
    @url_post.destroy

    respond_to do |format|
      format.html { redirect_to url_posts_url }
      format.json { head :no_content }
    end
  end
end
