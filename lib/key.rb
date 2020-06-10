class Key
 #attr_reader
  #def initialize(*arg)

  #end
  def random_numbers
    rand(99999).to_s.rjust(5, "0")
  end

  def set_keys
    a_thru_d_keys_array = []
      random_numbers.chars.each_cons(2).each do |num1, num2|
      require "pry"; binding.pry
      end



  end


end
