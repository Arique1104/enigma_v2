class Key
 attr_reader  :assigned_random_numbers
  def initialize(nums = random_numbers)
    @assigned_random_numbers = nums
  end

  def random_numbers
    rand(99999).to_s.rjust(5, "0")
  end

  def set_keys
    @assigned_random_numbers
    require "pry"; binding.pry
    combined_keys = []
      @assigned_random_numbers.chars.each_cons(2).each do |num1, num2|
        require "pry"; binding.pry
      end
  end


end
