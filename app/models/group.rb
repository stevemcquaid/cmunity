class Group < ActiveRecord::Base
  has_many :contents
  has_many :user_groups
  has_many :users, :through => :user_groups
  
  before_create :add_user_to_group

   private
   def add_user_to_group
     user_groups.build(:user => current_user, :group => self)
   end
end
