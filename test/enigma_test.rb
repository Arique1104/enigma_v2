require "./test/test_helper"
require "./lib/enigma"

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new

  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end


  def test_it_has_alphabet_array

    expect = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expect, @enigma.alphabet

  end







  def test_it_can_encrypt_message
    skip

    @enigma.stubs(:get_date).returns("060820")
    expected = {:encryption=>"vescb cfelk!", :date=>"060920", :key=>"12345"}

    assert_equal expected, @enigma.encrypt("Hello World!")
  end

  def test_it_can_decrypt
    skip
    expected = {:encryption=>"hello world!", :date=>"060920", :key=>"12345"}
    assert_equal expected, @enigma.decrypt("vescb cfelk!", "060820", "12345")
  end

end
