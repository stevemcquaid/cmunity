class User < ActiveRecord::Base
  # Associations
  # -----------------------------
  has_many :contents
  has_many :user_groups
  has_many :groups, :through => :user_groups
  
  # Scopes
  # -----------------------------
  scope :alphabetical, order("last_name, first_name")
  
  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :first_name, :last_name, :email  
  validates_uniqueness_of :email, :allow_blank => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid format", :allow_blank => true
  #need more validations when adding password + signed up, email validated, and authorized etc.
  
  def name
    first_name + " " + last_name
  end
  
end
