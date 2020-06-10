require "date"

class Offset
 attr_reader  :date
  def initialize(date = get_date)
    @date = date

  end

  def get_date
    now = Time.now
    now_formatted = now.strftime("%m%d%y")
  end

  def get_last_four
    int_date = @date.to_i
    sq_date = int_date * int_date
    string_sq_date = sq_date.to_s
    last_four = string_sq_date[-4..-1]
    last_four
  end

  def set_keys
    get_offsets = get_last_four.split(//)
    assigned_offsets = Hash.new
    assigned_offsets[:a_key] = get_offsets[0].to_i
    assigned_offsets[:b_key] = get_offsets[1].to_i
    assigned_offsets[:c_key] = get_offsets[2].to_i
    assigned_offsets[:d_key] = get_offsets[3].to_i
    assigned_offsets
  end



end
