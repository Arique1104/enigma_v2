require_relative "enigma.rb"

message = File.open("message.txt", "r")

@enigma = Enigma.new(message)

incoming_text = message.read

message.close

encrypted_text = @enigma.encrypt(incoming_text)

writer = File.open("encrypted.txt", "w")

writer.write(encrypted_text)

writer.close

puts encrypted_text
