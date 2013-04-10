class Role < ActiveRecord::Base

  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  belongs_to :group, :class_name => "Group", :foreign_key => "resource_id"

  attr_accessible :name, :resource_type, :resource_id
  
  scopify

  scope :users, joins{users}
  scope :groups, where{resource_type.eq "Group"}

  def user
  	self.users[0]
  end

  def group
  	if self.resource_type == "Group"
  		Group.find(self.resource_id)
  	else
  		nil
  	end
  end

end
