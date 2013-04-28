require 'test_helper'

class ApprovalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:group)
  should belong_to(:sender)
  should belong_to(:approvable)

#attr_accessible :approvable_id, :approvable_type, :group_id, :received_at, :replied_at, :sender_id, :sender_type, :sent_at, :status
	
	test "attr_accessible" do
		allow_mass_assignment_of(:approvable_id)
		allow_mass_assignment_of(:approvable_type)
		allow_mass_assignment_of(:group_id)
		allow_mass_assignment_of(:received_at)
		allow_mass_assignment_of(:replied_at)
		allow_mass_assignment_of(:sender_id)
		allow_mass_assignment_of(:sender_type)
		allow_mass_assignment_of(:sent_at)
		allow_mass_assignment_of(:status)
	end
end
