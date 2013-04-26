require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
	# test relationships
	should belong_to(:owner)
	should belong_to(:trackable)

	#must test all scopes

	#others
	test "attr_accessible" do
		allow_mass_assignment_of(:action)
		allow_mass_assignment_of(:owner)
		allow_mass_assignment_of(:trackable)
		allow_mass_assignment_of(:owner_id)
		allow_mass_assignment_of(:owner_type)
	end
		
  # test "the truth" do
  #   assert true
  # end
end
