class Key
 attr_reader  :assigned_random_numbers
  def initialize(nums = random_numbers)
    @assigned_random_numbers = "12345"
  end

  def random_numbers
    rand(99999).to_s.rjust(5, "0")
  end

  def get_keys
    combined_keys = []
      @assigned_random_numbers.chars.each_cons(2).each do |num1, num2|
        combined_keys << num1 + num2
      end
      combined_keys
  end

  def set_keys
    assigned_keys = Hash.new
    get_keys
    key_letters = ("A".."D").to_a
    require "pry"; binding.pry
  end


end
