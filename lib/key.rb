class Key
 #attr_reader
  #def initialize(*arg)

  #end
  def random_numbers
    rand(99999).to_s.rjust(5, "0")
  end

  def set_keys
    random_numbers


  end


end
