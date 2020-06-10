require "./test/test_helper"
require "./lib/offset"

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_can_get_date
    assert_equal "061020", @offset.date
  end

end
