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

end
