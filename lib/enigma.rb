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
    @date = date
    @key = key
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
    last_four
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
