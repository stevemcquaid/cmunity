require 'test_helper'

class ApprovalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:group)
  should belong_to(:sender)
  should belong_to(:approvable)

	

#attr_accessible :approvable_id, :approvable_type, :group_id, :received_at, :replied_at, :sender_id, :sender_type, :sent_at, :status
	
end
