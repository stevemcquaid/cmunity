class Content < ActiveRecord::Base
  belongs_to :group, :class_name => "Group", :foreign_key => :parent_group_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  belongs_to :media, polymorphic: true
  
  attr_accessible :title, :creator_id, :parent_group_id, :is_private, :date_modified, :date_created
end
