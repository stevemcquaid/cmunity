class UrlPost < ActiveRecord::Base

  has_many :content, :as => :mediable, dependent: :destroy
  has_one :group, :through => :content, :foreign_key => 'parent_group_id'
  has_one :user, :through => :user, :foreign_key => 'creator_id'
  has_many :activities, :as => :trackable
  accepts_nested_attributes_for :content
  attr_accessible :url, :domain_url, :image_url, :content_attributes
end
