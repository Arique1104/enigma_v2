require "./test/test_helper"
require "./lib/enigma"

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new("Hello World!")

  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    skip
  end

  def test_it_has_alphabet_array

    expect = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expect, @enigma.alphabet

  end



  def test_it_can_generate_random_key
    # skip
    assert_instance_of String, @enigma.get_key

    assert_equal 5, @enigma.get_key.length

  end

  def test_it_can_generate_final_offset

      @enigma.stubs(:get_key).returns("12345")
      @enigma.stubs(:get_date).returns("060820")
      @enigma.set_key
      assert_equal "14", @enigma.a_key
      assert_equal "27", @enigma.b_key
      assert_equal "34", @enigma.c_key
      assert_equal "45", @enigma.d_key

  end

  def test_it_can_encrypt_message

    @enigma.stubs(:get_date).returns("060820")
    expected = {:encryption=>"vescb cfelk!", :date=>"060820", :key=>"12345"}

    assert_equal expected, @enigma.encrypt("Hello World!")
  end

  def test_it_can_decrypt

  end

end
