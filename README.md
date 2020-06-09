# enigma_v2

I came back and started over with this project.  I'm proud on how I was able to slim my methods down and learned some pretty awesome features.

I would've liked to have stronger commit messages and branching in this round, but speed and adaptation were of main importance.  That is why I would like to offer the information for my first attempt at Enigma

(First Attempt at Enigma)[https://github.com/Arique1104/enigma]

The initial design was:

```ruby
Enigma
^
Decryption
^
Encryption
^
Offset
^
The Keys
```

As I went coding and got closer to Enigma, I realized that I had too many pieces of functionality scattered illogically throughout my classes.

Secondary Design
```ruby
Enigma
^
Decryption.txt
^
Encryption.txt > Encryption Module
^
Offset
^
Offset Calculations
^
Today Date
^
Key Feature
^
The Keys
```
This was even more of a hot mess but I got some serious learning done.

For example

`.rotate!` will permanently rotate an array which perfectly resolved the problem I was having about each key rotated by `a-d_key`'s different offset numbers.

`% 10000` will give you the last four digits of a long digit number

`@key[0..1]` did you know you could use array-like syntax to get a range within a string?  That was news to me, but when I found it I kept it!

`rand(99999)` is the code I ended up keeping for generating my random key. This isn't one of my favorites, but it is elegant and simple.  It scares me because 1 could also be randomly picked within this key and the right adjustment w/ "0" took too much out of my hands, and made me feel uncomfortable.  But it works, I have to trust it'll work.

`.split(//)` became an all-time favorite for me in this project!

In this final iteration of my project, the design was simpler:

```ruby
Decrypt.rb
^
Encrypt.rb
^
Enigma < Date Module
```
With the Enigma#Encrypt taking me the longest to learn and refactor.

> FROM 76 LINES TO 16.

That is one of my proudest wins in this project.

## Future Iterations
`mocks and stubs`
- I am not where I want to be in my understanding and execution of mocks and stubs.  I have some tests that will consistently fail because of working random code and changing date.  Mocks and stubs would've fixed this, but I couldn't get it to work properly.  I am not comprehending the object versus result versus mock versus stub dynamic.

`modules`
- I would've liked to implement at least one proper module in this project.  When I first tried, I used it as a last ditch effort in my enigma v1.  That did not end well.  In theory, I should be able to use the full body of the encrypt and decrypt methods because they use the exact same information.  Polymorphism and I have some serious trust issues.  
- If I had more time, I would've liked to play with a "Cryptable" module (do you like that? it's the only letters that decrypt and encrypt have in common with the module naming convention.)  However, I shy'd away from that because I didn't have a clear analysis of state vs. behavior.
- The only real difference is that my keys are made negative to decrypt and positive to encrypt.  But testing and designing that didn't come on time for me this round.

`DRY`
I do not have dry code.  I recognize that.  

## File I/O
I never thought I would get to this part.  It is not perfect but it is almost functioning.  The encryption works perfectly.  But decryption has some bugs I couldn't figure out.

### Encrypt
SAMPLE CODE GIVEN FROM TURING SCHOOL
`$ ruby ./lib/encrypt.rb message.txt encrypted.txt`

- Works when I put this in the terminal:
 `ruby encrypt.rb message.txt encrypted.txt`

#### RESULT
`{:encryption=>"vescb cfelk!\n", :date=>"060820", :key=>"12345"}`



### Decrypt
SAMPLE CODE GIVEN FROM TURING SCHOOL
`$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818`

- Works when I put this in the terminal:
`decrypt.rb encrypted.txt decrypted.txt`

- However, I need to copy the encrypted message exactly because it prints with `\n` and `\` all over the place!  And it doesn't respond to .chomp or .gsub nor does it decipher it.

#### WHEN I DON'T COPY PASTE THE ENCRYPTED MESSAGE:
`{:encryption=>
  "{:ywprryfihw=>\"drswkmcznyk!\\ \",i:dubr=>\"060820\",m:dnk=>\"12345\"}",
 :date=>"060820",
 :key=>"12345"}`

#### WHEN I COPY PASTE THE ENCRYPTED MESSAGE:
`{:encryption=>"hello world!", :date=>"060820", :key=>"12345"}`
