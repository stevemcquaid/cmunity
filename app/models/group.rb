class Group < ActiveRecord::Base
  resourcify
  has_many :contents
  has_many :user_groups
  has_many :users, :through => :user_groups
  
  # Scopes
  scope :userIsAMember, lambda { |user_id| where("user = ?", user_id) }
end
