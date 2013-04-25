class ContentsController < ApplicationController
  load_and_authorize_resource
  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @content = Content.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/new
  # GET /contents/new.json
  def new
    @content = Content.new
    @content.creator_id ||= current_user

    if params.has_key?(:type)
      if params[:type] == "Text"
        @text = TextPost.new
        @text.build_content
        @text.content = @content
      elsif params[:type] == "Url"
        @url = UrlPost.new
        @url.build_content
        @url.content = @content
      elsif params[:type] == "Video"
        @video = VideoPost.new
        @video.build_content
        @video.content = @content
      elsif params[:type] == "Image"
        @image = ImagePost.new
        @image.build_content
        @image.content = @content
      elsif params[:type] == "Event"
        @event = EventPost.new
        @event.build_content
        @event.content = @content
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content }
    end
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(params[:content])

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render json: @content, status: :created, location: @content }
      else
        format.html { render action: "new" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contents/1
  # PUT /contents/1.json
  def update
    @content = Content.find(params[:id])
    #Add Date Created, Date Modified
    @content.date_modified = Time.now

    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content = Content.find(params[:id])
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url }
      format.json { head :no_content }
    end
  end
end
