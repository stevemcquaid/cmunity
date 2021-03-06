class UrlPostsController < ApplicationController
  
  def index
    @urls = UrlPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @urls }
    end
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    @url = UrlPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @url }
    end
  end

  # GET /urls/new
  # GET /urls/new.json
  def new
    @url = UrlPost.new
    @url.build_content
    @url.content.mediable = @url
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @url }
    end
  end

  # GET /urls/1/edit
  def edit
    @url = UrlPost.find(params[:id])
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = UrlPost.new(params[:url_post])
    @url.content.creator= current_user
    respond_to do |format|
      if @url.save
        track_activity @url
        format.html { redirect_to post_path(@url.content), notice: 'Url post was successfully created.' }
        format.json { render json: @url, status: :created, location: @url }
      else
        format.html { render action: "new" }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /urls/1
  # PUT /urls/1.json
  def update
    @url = UrlPost.find(params[:id])

    respond_to do |format|
      if @url.update_attributes(params[:url_post])
        track_activity @url
        format.html { redirect_to @url, notice: 'Url post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url = UrlPost.find(params[:id])
    @url.destroy
    track_activity @url
    respond_to do |format|
      format.html { redirect_to urls_url }
      format.json { head :no_content }
    end
  end

  def fetch
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
