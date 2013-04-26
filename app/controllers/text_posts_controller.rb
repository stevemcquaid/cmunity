class TextPostsController < ApplicationController
  # GET /texts
  # GET /texts.json
  def index
    @texts = TextPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @texts }
    end
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
    @text = TextPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text }
    end
  end

  # GET /texts/new
  # GET /texts/new.json
  def new
    @text = TextPost.new
    @text.build_content
    @text.content.mediable = @text

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text }
    end
  end

  # GET /texts/1/edit
  def edit
    @text = TextPost.find(params[:id])
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = TextPost.new(params[:text_post])
    @text.content.creator = current_user
    respond_to do |format|
      if @text.save
        track_activity @text
        format.html { redirect_to post_path(@text.content), notice: 'Text post was successfully created.' }
        format.json { render json: @text, status: :created, location: @text }
      else
        format.html { render action: "new" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /texts/1
  # PUT /texts/1.json
  def update
    @text = TextPost.find(params[:id])

    respond_to do |format|
      if @text.update_attributes(params[:text_post])
        track_activity @text
        format.html { redirect_to @text, notice: 'Text post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text = TextPost.find(params[:id])
    @text.destroy
    track_activity @text
    respond_to do |format|
      format.html { redirect_to texts_url }
      format.json { head :no_content }
    end
  end
end
