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
    assert_instance_of String, @offset.date
    assert_equal 6, @offset.date.length

  end

end
