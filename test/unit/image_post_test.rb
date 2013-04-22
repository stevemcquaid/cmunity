require 'test_helper'

class ImagePostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should have_one(:content)
end
