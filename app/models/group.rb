class Group < ActiveRecord::Base
  resourcify
  has_many :contents, :foreign_key => :parent_group_id
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  has_many :activities, :as => :owner
  has_many :event_posts, :through => :contents, :source => :media, :source_type => "EventPost"
  has_many :image_posts, :through => :contents, :source => :media, :source_type => "ImagePost"
  has_many :text_posts, :through => :contents, :source => :media, :source_type => "TextPost"
  has_many :url_posts, :through => :contents, :source => :media, :source_type => "UrlPost"
  has_many :video_post, :through => :contents, :source => :media, :source_type => "VideoPost"


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  
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
