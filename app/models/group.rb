class Group < ActiveRecord::Base
  resourcify
  has_many :contents
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  
  # Scopes
  scope :userIsAMember, lambda { |user_id| where("user = ?", user_id) }

  def find_admin
      @adminRole = Role.where("name = ? AND resource_id = ? AND resource_type = ?", "admin", self.id, "Group").first
      @userRole = UsersRole.where("role_id = ?", @adminRole.id).first
      @user = User.find(@userRole.user_id)
      @user.name
  end

  def get_member_names
    self.users.collect(&:name)
  end
end
