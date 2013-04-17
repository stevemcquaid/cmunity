require 'test_helper'

class ContentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should validate_presence_of(:description)
  should validate_presence_of(:creator_id)
  should validate_presence_of(:mediable_type)
  should validate_presence_of(:mediable_id_exists)
  should validate_presence_of(:creator_id_exists)
  should allow_value("hi").for(:title)
  should allow_value("this is a test").for(:title)
  should allow_value("").for(:parent_group_id) #how to validate :parent_group_id_exists unless :parent_group:id is nil?


  should_not allow_value("a").for(:title)
  should_not allow_value("3").for(:title)
  should_not allow_value("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxy").for(:title)
end