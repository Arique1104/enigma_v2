handle = File.open(ARG[0], "r")

message_text = "I bet you'll you a good programmer, Arique!"

message_text = handle.read

handle.close

encrypted_text = @enigma.encrypt(message_text)


writer = File.open(AGV[1], "w")

writer.write(encrypted_text)

writer.close

# The first is an existing file that contains a message to encrypt.

#message to encrypt


#The second is a file where your program should write the encrypted message. In addition to writing the encrypted message to the file, your program should output to the screen the file it wrote to, the key and the date.


# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818
