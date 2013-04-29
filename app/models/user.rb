include ActionView::Helpers::NumberHelper

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :cell
  
  has_many :contents, :foreign_key => 'creator_id'
  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :activities, :as => :owner
  has_many :cosponsors, :foreign_key => 'creator_id'
  has_many :approvals, :as => :sender
  has_many :event_posts, :through => :contents, :source => :mediable, :source_type => "EventPost"
  has_many :image_posts, :through => :contents, :source => :mediable, :source_type => "ImagePost"
  has_many :text_posts, :through => :contents, :source => :mediable, :source_type => "TextPost"
  has_many :url_posts, :through => :contents, :source => :mediable, :source_type => "UrlPost"
  has_many :video_post, :through => :contents, :source => :mediable, :source_type => "VideoPost"
  has_many :users_roles
  has_many :roles, :through => :users_roles

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"}
  
  # Scopes
  # -----------------------------
  scope :alphabetical, order("last_name, first_name")
  
  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :first_name, :last_name, :email, :cell
  validates_uniqueness_of :email, :allow_blank => true, :message => "must not be nil"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid format", :allow_blank => false
  #need more validations when adding password + signed up, email validated, and authorized etc.
  validates :password, :length => { :in => 6..20 }, :presence => true, :if => lambda { new_record? || !password.nil? }
  validates :cell, :length => { :is => 10 } #before validation we gsub away all non-digits.

  #Validations for Avatar...need form
  #validates_attachment :avatar, :presence => true, :content_type => { :content_type => "image/jpg" }, :size => { :in => 0..1000.kilobytes }
  #validates_with AttachmentPresenceValidator, :attributes => :avatar
  
  before_validation do
    self.cell = self.cell.gsub(/\D/, '') unless self.cell.nil?
  end
  
  def formattedCellPhone
    if !self.cell.nil?
      number_to_phone(self.cell)
    end
  end
  
  def name
    first_name + " " + last_name
  end

  def by_group_role(role = 'member')
    uid = self.id
    groups = nil
    if role == 'officer'
      groups = Group.joins{roles.users}.where{ (roles.name.not_eq 'admin') & (roles.name.not_eq 'member') & (roles.resource_type.eq 'Group') & (users.id.eq uid)}      
    else
      groups = Group.joins{roles.users}.where{ (roles.name.eq role) & (roles.resource_type.eq 'Group') & (users.id.eq uid)}
    end
  end

  def is_member?(group)
    groups = self.group_ids
    groups.include?(group.id)
  end

  def guest?
    self.id.nil?
  end
  
  # def is_admin?(group)
  #   self.by_group_role('admin').include?(group)
  # end
  # 
  # def is_officer?(group)
  #   self.by_group_role('officer').include?(group)
  # end

end