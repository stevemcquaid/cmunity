class GroupsController < ApplicationController
  load_and_authorize_resource
  helper ApplicationHelper
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.order('updated_at DESC').paginate(:page => params[:page], :per_page => 10)
    @CU = current_user
    
    #logged in
    @myGroups = current_user.groups.order('updated_at DESC').paginate(:page => params[:page], :per_page => 10) unless current_user.nil?
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end
  
  # GET /mygroups
  # GET /mygroups.json
  def index_my_groups
    #logged in
    @myGroups = current_user.groups.paginate(:page => params[:page], :per_page => 10) unless current_user.nil?
    
    respond_to do |format|
      format.html # index_my_groups.html.erb
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
  
  def send_message
    @group = Group.find(params[:group][:id])
    
    members = params[:group]["users_to_message"]
    members.reject! { |m| m.empty? }
    message = params[:group]["message"]
    
    logger.debug "Members: #{members}"
    
    if (@group.isMessageValid?(message) && @group.isMemberValid?(members))
      members.each do |u|
        user = User.find(u)
        self.twilio(user.cell, message) unless user.cell.nil?
      end
      
      
      
      redirect_to groups_url, notice: 'Message Sent.'
      return
      
    else
      
      if !(@group.isMemberValid?(message))
        redirect_to group_path(@group), alert: "Please select members to send message"
        return
      end
      
      if !(@group.isMessageValid?(message))
        redirect_to group_path(@group), alert: "Message must be at least 1 character"
        return
      end
      
    end
  end

  def twilio(number_to_send_to, the_message)
    twilio_sid = "ACb18218cb24a64fe207de2f020d414ed7"
    twilio_token = "08faea04bc6260e3204e32c7898e5f4a"
    twilio_phone_number = "4128880020"
 
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => the_message
    )
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
