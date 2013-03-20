class Group < ActiveRecord::Base
  has_many :contents
  has_many :user_groups
  has_many :users, :through => :user_groups
  
  # Scopes
  scope :my, where("user = ?", self.current_user) #this is not stable
end
