class Content < ActiveRecord::Base
  
  belongs_to :mediable, :polymorphic => true
  belongs_to :group, :class_name => "Group", :foreign_key => :parent_group_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
 
  attr_accessible :title, :creator_id, :parent_group_id, :is_private, :description, :mediable_id, :mediable_type

  scope :public, where{ is_private.eq false }
  scope :private, where{ is_private.eq true }
  scope :texts, where{ mediable_type.eq 'TextPost' }
  scope :images, where{ mediable_type.eq 'ImagePost' }
  scope :urls, where{ mediable_type.eq 'UrlPost' }
  scope :videos, where { mediable_type.eq 'VideoPost' }
  scope :events, where{ mediable_type.eq 'EventPost' }
  scope :by_group, lambda {|group_id| where(:parent_group_id => group_id) }  
  scope :by_creator, lambda {|creator_id| where(:creator_id => creator_id) }

  def can_manage?(user)
    user.has_role? 'admin', self.group
  end

  def member_approved?(user)
    user.is_a_member?(self.group)
  end



end
