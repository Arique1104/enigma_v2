require 'date'

class Enigma
 attr_reader  :message,
              :date,
              :key,
              :encrypt,
              :a_key,
              :b_key,
              :c_key,
              :d_key
  def initialize(message, date = get_date, key = get_key)
    @message = message
    @date = "060820"
    @key = "12345"
    @encrypt = {}
  end

  def alphabet
      ("a".."z").to_a << " "
  end

  def get_date
    now = Time.now
    now_formatted = now.strftime("%m%d%y")
  end

  def get_key
    rand(99999).to_s.rjust(5, "0")
  end

  def get_last_four
    # int_date = get_date.to_i
    int_date = @date.to_i
    sq_date = int_date * int_date
    last_four = "#{sq_date % 10000}"
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
      message_array_of_hashes = []
      message_array.map do |letter|
        letter_index = alphabet.index(letter)
        hash = {letter => letter_index}
        message_array_of_hashes << hash
      end

      # Add or transform values based on offset key
      count = 0
      rotation_key_array = []
      message_array_of_hashes.each do |hash|
        hash.each do |letter, index|
          if count == 0
            if index == nil
              hash[letter] = letter
              count += 1
              rotation_key_array << hash
            else
              hash[letter] += @a_key.to_i
              count += 1
              rotation_key_array << hash
            end
          elsif count == 1
            if index == nil
              hash[letter] = letter
              count += 1
              rotation_key_array << hash
            else
              hash[letter] += @b_key.to_i
              count += 1
              rotation_key_array << hash
            end
          elsif count == 2
            if index == nil
              hash[letter] = letter
              count += 1
              rotation_key_array << hash
            else
              hash[letter] += @c_key.to_i
              count += 1
              rotation_key_array << hash
            end
          else count == 3
            if index == nil
              hash[letter] = letter
              count -= 3
              rotation_key_array << hash
            else
              hash[letter] += @d_key.to_i
              count -= 3
              rotation_key_array << hash
            end
          end
        end
      end
          encryption_key_array = []
          rotation_key_array.each do |hash|
            hash.each do |letter, rotation|
            if rotation != letter
              encrypted_letter = alphabet.rotate(rotation)[0]
              hash[letter] = encrypted_letter
              encryption_key_array << hash
            else
              encryption_key_array << hash
            end
          end
        end
        encrypted_message = encryption_key_array.flat_map do |hash|
          hash.values
        end
        print_encrypted_message = encrypted_message.join

        encryption_hash = {}
        encryption_hash[:encryption] = print_encrypted_message
        encryption_hash[:date] = @date
        encryption_hash[:key] = @key
        encryption_hash
    end









end
