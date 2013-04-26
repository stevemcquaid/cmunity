class Content < ActiveRecord::Base
  
  belongs_to :mediable, :polymorphic => true
  belongs_to :group, :class_name => "Group", :foreign_key => :parent_group_id
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  belongs_to :creator_group, :class_name => "Group", :foreign_key => :post_as
 
  has_one :text_post, :through => :mediable, :source => :eventable, :source_type => 'TextPost'

  attr_accessible :title, :creator_id, :parent_group_id, :post_as, :is_private, :description, :mediable_id, :mediable_type

  scope :public, where{ is_private.eq false }
  scope :private, where{ is_private.eq true }
  scope :texts, where{ mediable_type.eq 'TextPost' }
  scope :images, where{ mediable_type.eq 'ImagePost' }
  scope :urls, where{ mediable_type.eq 'UrlPost' }
  scope :videos, where { mediable_type.eq 'VideoPost' }
  scope :events, where{ mediable_type.eq 'EventPost' }
  scope :by_group, lambda {|group_id| where(:parent_group_id => group_id) }  
  scope :by_creator, lambda {|creator_id| where(:creator_id => creator_id) }

  #validates :description, :presence => true, :unless => :isTextPost? # Validates presence of description unless TextPost
  validates :title, :presence => true, :length => { :in => 2..50 }
  validates :creator_id, :presence => true
  #validates :parent_group_id, :allow_blank => true   # Can't validate only on allow blank
  #validates :mediable_type, :presence => true, :inclusion => { :in => ["TextPost", "ImagePost", "UrlPost", "VideoPost", "EventPost"] }
  #validates :mediable_id, :presence => true
  validate :creator_id_exists
  #validate :parent_group_id_exists, :unless => Proc.new { |c| c.parent_group_id.nil?}
  #validate :mediable_id_exists

  def can_manage?(user)
    user.has_role? 'admin', self.group
  end

  def member_approved?(user)
    user.is_member?(self.group)
  end

  def creator_id_exists
    begin
      User.find(self.creator_id)
    rescue ActiveRecord::RecordNotFound
      errors.add(:creator_id, "User creating content must exist")
      false
    end
  end

  def parent_group_id_exists
    return true if self.parent_group_id.nil?
    begin
      Group.find(self.parent_group_id)
    rescue ActiveRecord::RecordNotFound
      errors.add(:parent_group_id, "User creating content must exist")
      false
    end
  end
  
  def isTextPost?
    self.mediable_type == "TextPost"
  end
   

  def mediable_id_exists
    klass = self.mediable_type.constantize
    begin
      klass.find(self.mediable_id)
    rescue ActiveRecord::RecordNotFound
      errors.add(:mediable_id, "Trolls stole my keyboard...again. Mediable type must exist")
      false
    end
  end


end
