class VideoPost < ActiveRecord::Base
 
  has_one :content, :as => :mediable, dependent: :destroy
  has_many :activities, :as => :trackable
  
  accepts_nested_attributes_for :content
end
