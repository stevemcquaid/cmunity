class TextPost < ActiveRecord::Base
  has_one :content, as: :media, dependent: :destroy
  accepts_nested_attributes_for :content
  attr_accessible :text, :content_attributes
end
