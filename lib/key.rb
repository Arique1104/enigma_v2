class Key
 attr_reader  :assigned_random_numbers
  # def initialize
  #
  # end

  def random_numbers
     numbers = rand(99999).to_s.rjust(5, "0")
     @assigned_random_numbers = numbers
    require "pry"; binding.pry
  end

  def set_keys
    @assigned_random_numbers
    require "pry"; binding.pry
    a_thru_d_keys_array = []
      random_numbers.chars.each_cons(2).each do |num1, num2|
      require "pry"; binding.pry
      end
  end


end
