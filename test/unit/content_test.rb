require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #should belong_to(:mediable)
  should belong_to(:group)
  should belong_to(:creator)


  should validate_presence_of(:title)
  should validate_presence_of(:creator_id)
  #should validate_presence_of(:creator_id_exists)

  should allow_value("Ab").for(:title)
  should allow_value("Hi balhblahba").for(:title)

  should_not allow_value("a").for(:title)
  should_not allow_value("3").for(:title)
  should_not allow_value("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstu").for(:title)
end
