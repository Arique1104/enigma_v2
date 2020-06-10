require "./test/test_helper"
require "./lib/key"

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_has_attributes
    assert_equal 5, @key.assigned_random_numbers.length
  end

  def test_it_can_generate_random_key
    assert_instance_of String, @key.random_numbers

    assert_equal 5, @key.random_numbers.length

  end

  def test_it_can_sparse_correct_keys
    # skip
    assert_equal 4, @key.get_keys.count
  end

  def test_it_can_generate_key_hash
        expected = {
          :a_key => 12,
          :b_key => 23,
          :c_key => 34,
          :d_key => 45
        }
        assert_equal expected, @key.set_keys

  end

end
