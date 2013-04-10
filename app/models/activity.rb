class Activity < ActiveRecord::Base

  belongs_to :owner, polymorphic: true
  belongs_to :trackable, polymorphic: true
  attr_accessible :action, :owner, :trackable, :owner_id, :owner_type

  attr_accessor :user

  scope :groups, where{ trackable_type.eq "Group" }
  scope :roles, where{ trackable_type.eq "Role" }
  scope :texts, where{ trackable_type.eq "TextPost" }
  scope :images, where{ trackable_type.eq "ImagePost" }
  scope :urls, where{ trackable_type.eq "UrlPost" }
  scope :videos, where{ trackable_type.eq "VideoPost"}
  scope :events, where{ trackable_type.eq "EventPost" }
  scope :new_action, where{ action.eq "create" }
  scope :update_action, where{ action.eq "update" }
  scope :destroy_action, where{ action.eq "destroy" }
  scope :user_activity, where{ owner_type.eq "User" }
  scope :group_activty, where{ owner_type.eq "Group" }
  
  def user
  	if self.owner_type == "User"
  		User.find(self.owner_id)
  	else
  		nil
  	end 	
  end

end
