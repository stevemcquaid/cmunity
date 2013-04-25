class GroupsController < ApplicationController
  load_and_authorize_resource
  helper ApplicationHelper
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @CU = current_user
    
    #if not logged in
    @mygroups = current_user.groups unless current_user.nil?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])
    @group.memberships.build(:user => current_user, :group => @group)
    
    respond_to do |format|
      if @group.save
        track_activity @group
        current_user.add_role :admin, @group
        format.html { redirect_to groups_url, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        track_activity @group
        format.html { redirect_to groups_url, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    name = @group.name #needed for output message
    @group.destroy
    track_activity @group
    respond_to do |format|
      format.html { redirect_to groups_url, notice: "#{name} group was deleted." }
      format.json { head :no_content }
    end
  end
end
