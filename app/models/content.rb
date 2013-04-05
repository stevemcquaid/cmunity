class Content < ActiveRecord::Base
  
  belongs_to :mediable, :polymorphic => true
  belongs_to :group, :class_name => "Group", :foreign_key => :parent_group_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  
  attr_accessible :title, :creator_id, :parent_group_id, :is_private, :description

end
