require 'date'

class Enigma
 attr_reader  :a_key,
              :b_key,
              :c_key,
              :d_key
  def initialize
    @a_key
    @b_key
    @c_key
    @d_key
  end

  def alphabet
      ("a".."z").to_a << " "
  end

  def get_date
    now = Time.now
    now_formatted = now.strftime("%m%d%y")
  end

  def get_key
    # rand(99999).to_s.rjust(5, "0")
    # key = []
    # num1 = rand(9)
    # key << num1
    # num2 = rand(9)
    # key << num2
    # num3 = rand(9)
    # key << num3
    # num4 = rand(9)
    # key << num4
    # num5 = rand(9)
    # key << num5
    # key
    # key.join
    "12345"
  end

  def set_key
    int_date = get_date.to_i
    sq_date = int_date * int_date
    last_four = "#{sq_date % 10000}"
    last_four_array = last_four.split(//)
    key_array = get_key.split(//)
    a = "#{key_array[0].to_i}#{key_array[1].to_i}"
    b = "#{key_array[1].to_i}#{key_array[2].to_i}"
    c = "#{key_array[2].to_i}#{key_array[3].to_i}"
    d = "#{key_array[3].to_i}#{key_array[4].to_i}"
    @a_key = "#{a.to_i + last_four_array[0].to_i}"
    @b_key = "#{b.to_i + last_four_array[1].to_i}"
    @c_key = "#{c.to_i + last_four_array[2].to_i}"
    @d_key = "#{d.to_i + last_four_array[3].to_i}"

  end



end
