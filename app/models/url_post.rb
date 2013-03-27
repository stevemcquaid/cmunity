class UrlPost < ActiveRecord::Base
  has_one :content, as: :media, dependent: :destroy
  accepts_nested_attributes_for :content

  attr_accessible :url, :domain_url, :image_url, :content_attributes
end
