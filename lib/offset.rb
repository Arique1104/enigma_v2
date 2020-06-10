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
    sq_date.to_s = int_date * int_date
    require "pry"; binding.pry
    last_four = "#{sq_date % 10000}"
  end

end
