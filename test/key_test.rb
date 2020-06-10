require "./test/test_helper"
require "./lib/key"

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_can_save_one_random_key
    key1 = Key.new
    key2 = Key.new

    expected1 = key1.random_numbers
    assert_equal
  end

  def test_it_can_generate_random_key
    assert_instance_of String, @key.random_numbers

    assert_equal 5, @key.random_numbers.length

  end

  def test_it_can_sparse_correct_keys
    assert_equal 4, @key.set_keys.length
  end

  def test_it_can_generate_key_hash
    skip
        expected = {
          :a_key => 12,
          :b_key => 23,
          :c_key => 34,
          :d_key => 45
        }
        assert_equal expected, @key.set_key

  end

end
