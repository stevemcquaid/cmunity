class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  
  # Associations
  # -----------------------------
  has_many :contents
  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :activities, :as => :owner
  has_many :event_posts, :through => :contents, :source => :media, :source_type => "EventPost"
  has_many :image_posts, :through => :contents, :source => :media, :source_type => "ImagePost"
  has_many :text_posts, :through => :contents, :source => :media, :source_type => "TextPost"
  has_many :url_posts, :through => :contents, :source => :media, :source_type => "UrlPost"
  has_many :video_post, :through => :contents, :source => :media, :source_type => "VideoPost"
  

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  
  # Scopes
  # -----------------------------
  scope :alphabetical, order("last_name, first_name")
  
  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :first_name, :last_name, :email  
  validates_uniqueness_of :email, :allow_blank => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid format", :allow_blank => true
  #need more validations when adding password + signed up, email validated, and authorized etc.
  
  def name
    first_name + " " + last_name
  end
  
  def is_a_member?(group)
    groups = self.group_ids
    groups.include?(group.id)
  end

end
