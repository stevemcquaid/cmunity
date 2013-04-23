require 'test_helper'

class GroupTest < ActiveSupport::TestCase
	#Test relationships
   should have_many(:contents) #test foreign key
   should have_many(:memberships) #test dependent below
   should have_many(:users).through(:memberships) 
   should have_many(:roles) #test :as => :resource
   should have_many(:activities) #test :as => :owner
   should have_many(:approvals)
   # test should have_many(:approvals) :as => sender
   should have_many(:cosponsors) #test :foreign_key => 'sender_id'
   # test should have_many(:cosponsors) :foreign_key => 'receiver_id'
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

  #Other
  #for uniqueness of name
  # test "validates uniqueness of name" do
  #   should validate_uniqueness_of(:name)
  # end
  #must test can_manage
  #admin???

  #must write for destroying membership
  #below is a sample from web:
  # assert_difference "Comment.count", blog.comments.count do
  # blog(:with_comments).destroy
  # end

   #test "the truth" do
   #  assert true
   #end
end


