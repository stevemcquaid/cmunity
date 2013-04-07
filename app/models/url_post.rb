class UrlPost < ActiveRecord::Base

  has_one :content, :as => :mediable, dependent: :destroy
  has_one :group, :through => :content, :foreign_key => 'parent_group_id'
  has_one :creator, :through => :content
  has_many :activities, :as => :trackable

  accepts_nested_attributes_for :content
  attr_accessible :url, :domain_url, :image_url, :content_attributes
  
end
