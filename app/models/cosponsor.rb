class Cosponsor < ActiveRecord::Base
	
	belongs_to :sender, :class_name => "Group", :foreign_key => :sender_id
	belongs_to :receiver, :class_name => "Group", :foreign_key => :receiver_id
	belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
	belongs_to :event_post, :class_name => "EventPost", :foreign_key => :event_id
	has_many :approvals, :as => :approvable
  
  	attr_accessible :creator_id, :event_id, :receiver_id, :sender_id

end
