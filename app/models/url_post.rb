class UrlPost < ActiveRecord::Base

  has_many :content, :as => :mediable, dependent: :destroy
  has_many :activities, :as => :trackable
  accepts_nested_attributes_for :content
  attr_accessible :url, :domain_url, :image_url, :content_attributes
end
