class Key
 attr_reader  :assigned_random_numbers
  def initialize(nums = random_numbers)
    @assigned_random_numbers = nums
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
    assigned_keys[:a_key] = get_keys[0]
    assigned_keys[:b_key] = get_keys[1]
    assigned_keys[:c_key] = get_keys[2]
    assigned_keys[:d_key] = get_keys[3]
    assigned_keys
  end


end
