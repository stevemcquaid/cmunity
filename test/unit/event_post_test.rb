require 'test_helper'

class EventPostTest < ActiveSupport::TestCase
	#Test Relationship
	should have_one(:content) #:as => :mediable, dependent: :destroy
	should have_one(:group).through(:content) #:foreign_key => 'parent_group_id'
	should have_one(:creator).through(:content)
	should have_many(:activities) #:as => :trackable
	should have_many(:cosponsor) #:foreign_key => :event_id

	#accepts_nested_attributes_for :content
  	#accepts_nested_attributes_for :cosponsor

	test "attr_accessible" do
		allow_mass_assignment_of(:location)
		allow_mass_assignment_of(:start_date)
		allow_mass_assignment_of(:end_date)
		allow_mass_assignment_of(:start_time)
		allow_mass_assignment_of(:end_time)
		allow_mass_assignment_of(:is_all_day)
		allow_mass_assignment_of(:content_attributes)
		allow_mass_assignment_of(:cosponsor_attributes)
	end
	
  # test "the truth" do
  #   assert true
  # end
end
