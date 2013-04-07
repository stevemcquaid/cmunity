class Approval < ActiveRecord::Base

	belongs_to :group
	belongs_to :sender, :polymorphic => true
	belongs_to :approvable, :polymorphic => true
	
	attr_accessible :approvable_id, :approvable_type, :group_id, :received_at, :replied_at, :sender_id, :sender_type, :sent_at, :status
	

end
