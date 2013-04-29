class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :group
  has_many :approvals, :as => :approvable
  
  attr_accessible :user_id, :group_id, :user, :group


end
