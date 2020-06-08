require "./test/test_helper"
require "./lib/enigma"

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new

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

end
