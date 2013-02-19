class Content < ActiveRecord::Base
  belongs_to :group, :class_name => "Group", :foreign_key => :parent_group_id
  belongs_to :user, :class_name => "User", :foreign_key => :creator_id
  has_many :text_posts, :dependent => :destroy
  has_many :url_posts, :dependent => :destroy
  has_many :image_posts, :dependent => :destroy
  has_many :video_posts, :dependent => :destroy
  has_many :event_posts, :dependent => :destroy
  
end
