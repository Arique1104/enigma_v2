require_relative "enigma.rb"

message = File.open("encrypted.txt", "r")

@enigma = Enigma.new(message, date, key)

incoming_text = message.read

message.close

decrypted_text = @enigma.decrypt(@d_message, @decrypt_date, @decrypt_key)

writer = File.open("decrypted.txt", "w")

writer.write(decrypted_text)

writer.close

puts decrypted_text
