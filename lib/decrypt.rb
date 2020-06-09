require_relative "enigma.rb"

message = File.open("encrypted.txt", "r")

@enigma = Enigma.new(message, "060820", "12345")

incoming_text = message.read

message.close

decrypted_text = @enigma.decrypt("vescb cfelk!", "060820", "12345")

writer = File.open("decrypted.txt", "w")

writer.write(decrypted_text)

writer.close

puts decrypted_text
