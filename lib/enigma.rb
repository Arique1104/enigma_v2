class Enigma
 attr_reader
  def initialize

  end

  def alphabet
      ("a".."z").to_a << " "
  end

  def get_key
    # rand(99999).to_s.rjust(5, "0")
    @key = []
    num1 = rand(9)
    @key << num1
    num2 = rand(9)
    @key << num2
    num3 = rand(9)
    @key << num3
    num4 = rand(9)
    @key << num4
    num5 = rand(9)
    @key << num5
    @key 
    @key.join

  end

end
