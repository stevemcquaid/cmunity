class Content < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  has_many :text_posts, :dependent => :destroy
  has_many :url_posts, :dependent => :destroy
  has_many :image_posts, :dependent => :destroy
  has_many :video_posts, :dependent => :destroy
  has_many :event_posts, :dependent => :destroy
  
end
