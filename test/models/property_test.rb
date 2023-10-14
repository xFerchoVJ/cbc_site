require "test_helper"

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save property without params" do
    property = Property.new
    assert_not property.save
  end
end
