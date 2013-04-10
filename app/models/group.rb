class Group < ActiveRecord::Base

  resourcify
  has_many :contents, :foreign_key => 'parent_group_id'
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  has_many :roles, :as => :resource
  has_many :activities, :as => :owner
  has_many :approvals
  has_many :approvals, :as => :sender
  has_many :cosponsors, :foreign_key => 'sender_id'
  has_many :cosponsors, :foreign_key => 'receiver_id'
  has_many :event_posts, :through => :cosponsors, :foreign_key => 'event_id'
  has_many :event_posts, :through => :contents, :source => :mediable, :source_type => "EventPost"
  has_many :image_posts, :through => :contents, :source => :mediable, :source_type => "ImagePost"
  has_many :text_posts, :through => :contents, :source => :mediable, :source_type => "TextPost"
  has_many :url_posts, :through => :contents, :source => :mediable, :source_type => "UrlPost"
  has_many :video_post, :through => :contents, :source => :mediable, :source_type => "VideoPost"


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  
  # Scopes
  scope :userIsAMember, lambda { |user_id| where("user = ?", user_id) }
  scope :roles, joins{roles}
  
  def find_admin
      gid = self.id
      User.joins{roles}.where{(roles.name.eq 'admin') & (roles.resource_type.eq 'Group') & (roles.resource_id.eq gid)}.first
  end

  def can_manage?(user)
    if user.nil?
      false
    elsif user.has_role? 'admin', self
      true
    elsif user.has_role? 'member', self
      false
    else
      false
    end
  end


  def get_member_names
    self.users.collect(&:name)
  end

end
