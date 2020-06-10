class Key
 #attr_reader
  #def initialize(*arg)

  #end
  def get_key
    rand(99999).to_s.rjust(5, "0")
  end

end
