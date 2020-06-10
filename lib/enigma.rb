class Enigma
 attr_reader  :alphabet

  def initialize

  end


  def set_key
    last_four = get_last_four
    a = @key[0..1]
    b = @key[1..2]
    c = @key[2..3]
    d = @key[3..4]
    @a_key = "#{a.to_i + last_four[0].to_i}"
    @b_key = "#{b.to_i + last_four[1].to_i}"
    @c_key = "#{c.to_i + last_four[2].to_i}"
    @d_key = "#{d.to_i + last_four[3].to_i}"
  end


  def encrypt(message)
    set_key
    message_array = message.downcase.split(//)

    keys_array = [@a_key.to_i, @b_key.to_i, @c_key.to_i, @d_key.to_i]
    result = message_array.map do |letter|
      letter_index = alphabet.index(letter)
      if letter_index == nil
        new_letter = letter
      else
        new_letter = alphabet.rotate(letter_index + keys_array[0])[0]
      end
      keys_array.rotate!
      new_letter
    end
      encryption_hash(result.join)
  end

  def encryption_hash(encrypted_message)
    encrypted = {}
    encrypted[:encryption] =
    encrypted_message
    encrypted[:date] = @date
    encrypted[:key] = @key
    encrypted
  end

    def decrypt(d_message, decrypt_date, decrypt_key)
      d_message_array = d_message.downcase.split(//)
      decrypt_set_key(decrypt_key, decrypt_date)
      keys_array = [@decrypt_a_key.to_i, @decrypt_b_key.to_i, @decrypt_c_key.to_i, @decrypt_d_key.to_i]
      result = d_message_array.map do |letter|
        letter_index = alphabet.index(letter)
        if letter_index == nil
          new_letter = letter
        else
          new_letter = alphabet.rotate(letter_index + keys_array[0])[0]
        end
        keys_array.rotate!
        new_letter
      end
        encryption_hash(result.join)
    end

    def decrypt_set_key(decrypt_key, decrypt_date)
      @decrypt_key = decrypt_key
      @decrypt_date = decrypt_date
      decrypt_last_four = decrypt_get_last_four
      a = @decrypt_key[0..1]
      b = @decrypt_key[1..2]
      c = @decrypt_key[2..3]
      d = @decrypt_key[3..4]
      @decrypt_a_key = "#{(-a.to_i) + (-decrypt_last_four[0].to_i)}"
      @decrypt_b_key = "#{(-b.to_i) + (-decrypt_last_four[1].to_i)}"
      @decrypt_c_key = "#{(-c.to_i) + (-decrypt_last_four[2].to_i)}"
      @decrypt_d_key = "#{(-d.to_i) + (-decrypt_last_four[3].to_i)}"
    end

    def decrypt_get_last_four
      int_date = @decrypt_date.to_i
      sq_date = int_date * int_date
      last_four = "#{sq_date % 10000}"
    end


end
