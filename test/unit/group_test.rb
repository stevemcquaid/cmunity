require 'test_helper'

class GroupTest < ActiveSupport::TestCase
	#Test relationships
   should have_many(:contents)
   should have_many(:memberships)
   should have_many(:users).through(:memberships)
   should have_many(:roles)
   should have_many(:activities)
   should have_many(:approvals)

   should have_many(:cosponsors)

   # should have_many(:event_posts).through(:cosponsors)
   # should have_many(:event_posts).through(:contents)
   # should have_many(:image_posts).through(:contents)
   # should have_many(:text_posts).through(:contents)
   # should have_many(:url_posts).through(:contents)
   # should have_many(:video_posts).through(:contents)

  #Test basic validations
  #for name
  should allow_value("TSA").for(:name)
  should_not allow_value("T").for(:name)
  should_not allow_value(nil).for(:name)

  #for description
  should allow_value("Asian Student Association").for(:description)
  should_not allow_value(nil).for(:description)
  should_not allow_value("five").for(:description)

  #must test can_manage
  #admin???

   #test "the truth" do
   #  assert true
   #end
end


