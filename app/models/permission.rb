class Permission < ActiveRecord::Base
  
  belongs_to :role
  has_one :group, :through => :role, :source => :resource, :source_type => "Group"
  has_one :user,  :through => :role, :source => :users

  attr_accessible :action, :role_id, :subject_id, :subject_type

end
