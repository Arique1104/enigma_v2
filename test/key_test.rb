require "./test/test_helper"
require "./lib/key"

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_can_generate_random_key
    assert_instance_of String, @key.random_numbers

    assert_equal 5, @key.random_numbers.length

  end

end
