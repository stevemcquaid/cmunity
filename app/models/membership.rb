class Membership < ActiveRecord::Base

  belongs_to :user, dependent: :destroy
  belongs_to :group, dependent: :destroy
  has_many :approvals, :as => :approvable
  
  attr_accessible :user_id, :group_id, :user, :group


end
