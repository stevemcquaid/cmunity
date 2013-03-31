class Activity < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  belongs_to :trackable, polymorphic: true
  attr_accessible :action, :owner, :trackable
end
