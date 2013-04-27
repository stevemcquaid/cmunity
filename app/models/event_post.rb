class EventPost < ActiveRecord::Base

  has_one :content, :as => :mediable, dependent: :destroy
  has_one :group, :through => :content, :foreign_key => 'parent_group_id'
  has_one :creator, :through => :content
  has_many :activities, :as => :trackable
  has_many :cosponsor, :foreign_key => :event_id

  accepts_nested_attributes_for :content
  accepts_nested_attributes_for :cosponsor

  attr_accessible :photo, :location, :start_date, :end_date, :start_time, :end_time, :is_all_day, :content_attributes, :cosponsor_attributes

  has_attached_file :photo, :styles => { :large => "390x270>", :medium => "260x180>", :thumb => "130x90>" }

end
