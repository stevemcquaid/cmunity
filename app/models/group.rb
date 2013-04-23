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
  has_one :creator
  
  # has_many :event_posts, :through => :cosponsors, :foreign_key => 'event_id'
  # has_many :event_posts, :through => :contents, :source => :mediable, :source_type => "EventPost"
  # has_many :image_posts, :through => :contents, :source => :mediable, :source_type => "ImagePost"
  # has_many :text_posts, :through => :contents, :source => :mediable, :source_type => "TextPost"
  # has_many :url_posts, :through => :contents, :source => :mediable, :source_type => "UrlPost"
  # has_many :video_posts, :through => :contents, :source => :mediable, :source_type => "VideoPost"


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  
  
  # Validations
  validates :name, :presence => true, :length => { :minimum => 2 }, :uniqueness => true
  validates :description, :presence => true, :length => { :minimum => 5 }
  #validates_attachment :avatar, :presence => true, :content_type => { :content_type => "image/jpg" }, :size => { :in => 0..1000.kilobytes }
  #validates_with AttachmentPresenceValidator, :attributes => :avatar


  
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

  def get_contents
    self.contents
  end

  def get_officers
    self.roles
  end

  def get_member_names
    self.users.collect(&:name)
  end

end
