require "./test/test_helper"
require "./lib/offset"

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  #def test_it_has_attributes
  #end

end

# def get_date
#   now = Time.now
#   now_formatted = now.strftime("%m%d%y")
# end
